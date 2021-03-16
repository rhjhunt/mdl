FROM registry.fedoraproject.org/fedora-minimal:33

LABEL   name="mdl" \
        version="1.0.1" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source Markdown link tool in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave \
	     --env HOME=${HOME} --workdir $(pwd) --security-opt label=disable \
             rhjhunt/mdl"

RUN microdnf -y --nodocs update && \
    microdnf -y --nodocs install ruby ruby-devel && \
    microdnf clean all  && \
    rm -rf /var/cache/yum && \
    gem install --no-document mdl

WORKDIR /documents
VOLUME ["/documents"]

ENTRYPOINT ["/usr/local/bin/mdl"]

