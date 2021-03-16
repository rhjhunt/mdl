# mdl container

![Docker Image CI](https://github.com/rhjhunt/mdl/workflows/Docker%20Image%20CI/badge.svg)

Markdown lint container

## Pull

You can pull from Quay.io:

```terminal
podman pull quay.io/rhjhunt/mdl
```

You can also build your own:

```terminal
git clone https://github.com/rhjhunt/mdl.git
cd mdl
buildah bud -t mdl .
```

## Run

You can run the container interactively with the following command.

```terminal
podman run --rm -it --volume "${HOME}:${HOME}:rslave" --env "HOME=${HOME}" \
--security-opt label=disable --workdir "$(pwd)" quay.io/rhjhunt/mdl:latest
```

Or create an alias in your _~/.bashrc_ file.

```bash
alias mdl='podman run --rm -it \
        --volume "${HOME}:${HOME}:rslave" \
        --env "HOME=${HOME}" \
        --security-opt label=disable \
        --workdir "$(pwd)" \
        --entrypoint mdl \
        quay.io/rhjhunt/mdl:latest'
```

