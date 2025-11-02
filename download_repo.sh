#!/bin/sh
set -e

if [ -z "$HUGO_GITHUB_REPO" ] || [ -z "$HUGO_GITHUB_TOKEN" ]; then
  echo "Error: HUGO_GITHUB_REPO or HUGO_GITHUB_TOKEN not set."
  exit 1
fi

BRANCH="${HUGO_GITHUB_BRANCH:-main}"


echo "Loading https://api.github.com/repos/$HUGO_GITHUB_REPO/tarball/$BRANCH ..."
curl -sSL -H "Authorization: token $HUGO_GITHUB_TOKEN" \
     "https://api.github.com/repos/$HUGO_GITHUB_REPO/tarball/$BRANCH" \
  | tar -xz --strip-components=1 -C /data

echo "Repository successfully downloaded."
