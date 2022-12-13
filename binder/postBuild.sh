#!/bin/bash

SCALA_VERSION=2.12.10 ALMOND_VERSION=0.9.1

# Install coursier
curl -Lo coursier https://git.io/coursier-cli
chmod +x coursier

# Install almond
./coursier bootstrap \
    -r jitpack \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    --sources --default=true \
    -o almond
./almond --install

# Install required Jupyter/JupyterLab extensions
jupyter labextension install @jupyterlab/plotly-extension

# Install custom Javascript for solutions
mkdir -p ~/.jupyter/custom
cp source/custom.js ~/.jupyter/custom/custom.js