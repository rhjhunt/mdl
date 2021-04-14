FROM registry.access.redhat.com/ubi8:latest

LABEL   name="mdl" \
        version="1.0.1" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source Markdown link tool in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave \
	     --env HOME=${HOME} --workdir $(pwd) --security-opt label=disable \
             rhjhunt/mdl"

RUN dnf -y --nodocs update && \
    dnf -y --nodocs install @ruby:2.7 ruby-devel && \
    dnf clean all  && \
    rm -rf /var/cache/yum && \
    gem install --no-document mdl

WORKDIR /documents
VOLUME ["/documents"]

ENTRYPOINT ["/usr/local/bin/mdl"]
