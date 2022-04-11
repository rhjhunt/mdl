FROM registry.access.redhat.com/ubi8-minimal:latest

LABEL   name="mdl" \
        version="1.0.4" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source Markdown link tool in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave \
	     --env HOME=${HOME} --workdir $(pwd) --security-opt label=disable \
             rhjhunt/mdl"

RUN echo -e "[ruby]\nname=ruby\nstream=3.0\nprofiles=\nstate=enabled\n" > /etc/dnf/modules.d/ruby.module && \
    microdnf -y --nodocs update && \
    microdnf -y --nodocs install ruby ruby-devel make gcc redhat-rpm-config && \
    microdnf clean all  && \
    rm -rf /var/cache/yum && \
    gem install --no-document html_tokenizer && \
    gem install --no-document mdl

WORKDIR /docs

ENTRYPOINT ["mdl"]
