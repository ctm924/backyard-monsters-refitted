#!/bin/bash

JAVA_VER=$(java -version >/dev/null 2>&1)
if [[ $? -ne 0 ]]; then 
    echo "ERROR: You need to install Java first, ax3 requires it."
    exit 1
fi

CHOKIDAR_VER=$(chokidar -v >/dev/null 2>&1)
if [[ $? -ne 0 ]]; then 
    echo "ERROR: You need chokidar to run the watch command. Install it using: 'npm install --global chokidar-cli'"
    exit 1
fi

cd ..

chokidar -c "java -jar ax3/converter.jar ax3/config.json" "client/scripts/**/*"