#!/bin/bash

setup_git() {
  # Set the user name and email to match the API token holder
  # This will make sure the git commits will have the correct photo
  # and the user gets the credit for a checkin
  git config --global user.email ${GITHUBEMAIL}
  git config --global user.name ${GITHUBUSER}
  git config --global push.default matching

  # Get the credentials from a file
  git config credential.helper "store --file=.git/credentials"

  # This associates the API Key with the account
  echo "https://${GITHUBTOKEN}:@github.com" > .git/credentials
}

version() {
  export SEMVER_LAST_TAG=$(git describe --abbrev=0 --tags 2>/dev/null)
  export SEMVER_RELEASE_LEVEL=$(git log --oneline -1 --pretty=%B | cat | tr -d '\n' | cut -d "[" -f2 | cut -d "]" -f1)

  #curl -o /tmp/hub.tgz https://github.com/github/hub/releases/download/v2.2.9/hub-linux-arm64-2.2.9.tgz
  #tar -xvzf /tmp/hub.tgz -C /tmp

  if [ -z $SEMVER_LAST_TAG ]; then
      >&2 echo "No tags defined"
      SEMVER_LAST_TAG="0.0.1"
  fi

  if [ -n $SEMVER_RELEASE_LEVEL ]; then
      git clone https://github.com/fsaintjacques/semver-tool /tmp/semver &> /dev/null
      SEMVER_NEW_TAG=$(/tmp/semver/src/semver bump $SEMVER_RELEASE_LEVEL $SEMVER_LAST_TAG)
      git tag $SEMVER_NEW_TAG &> /dev/null
      git push origin --tags &> /dev/null
      echo $SEMVER_NEW_TAG
  else
      >&2 echo "No release level defined"
  fi
}

echo "Here are the creds"
echo ${GITHUBEMAIL}
echo ${GITHUBUSER}
echo "End of creds"
setup_git
version
exit 0
