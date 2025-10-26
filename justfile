dev:
    stata-mp "do developer"

readme:
    stata-mp "do readme-example"
    
[working-directory: 'site']
render:
    #!/usr/bin/env bash
    uv sync
    source .venv/bin/activate
    python -m nbstata.install
    quarto render
    rm -rf ../docs
    mkdir ../docs
    mkdir ../docs/img
    cp ../img/* ../docs/img/
    mv _site/* ../docs/

[working-directory: 'cscripts']
test:
    stata-mp -b "do master"
