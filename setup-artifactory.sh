#!/usr/bin/bash

set -e

if [ -z "$1" ]; then
    echo "USAGE: $0 <Artifactory deb repo API key>"
    echo follow instruction at https://urm.nvidia.com/ui/repos/tree/General/sw-sharp-debian
    echo log in, and press \"Set Me Up\" in the up-right corner to generate an API key
    exit 1
fi

if [ ! -f "/usr/local/bin/jfrog" ]; then
    echo installing jfrog cli...
    curl -fL https://getcli.jfrog.io | sh
    sudo mv jfrog /usr/local/bin/
    echo installation ended.
fi

jfrog config remove artifactory --quiet
jfrog config add artifactory --interactive=false --url=https://urm.nvidia.com --artifactory-url=https://urm.nvidia.com/artifactory --access-token=$1

echo JFrog CLI installed, and Artifactory access configured.
