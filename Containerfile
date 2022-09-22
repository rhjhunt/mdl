FROM registry.access.redhat.com/ubi9-minimal

LABEL   name="mdl" \
        version="1.0.6" \
        architecture="x86_64" \
        vcs-type="git" \
        summary="Open source Markdown link tool in Ruby" \
        maintainer="Jacob Hunt <jhunt@redhat.com>" \
        run="podman run --rm -it --volume ${HOME}:${HOME}:rslave \
	     --env HOME=${HOME} --workdir $(pwd) --security-opt label=disable \
             rhjhunt/mdl"

RUN microdnf -y update --nodocs --setopt install_weak_deps=0 && \
    microdnf -y install --nodocs --setopt install_weak_deps=0 ruby ruby-devel make gcc redhat-rpm-config && \
    microdnf clean all --enablerepo="*"  && \
    rm -rf /var/cache/{dnf,yum} && \
    rm -rf /var/lib/dnf/history.* && \
    gem install --no-document html_tokenizer && \
    gem install --no-document mdl && \
    rm -rf /var/log/*

WORKDIR /docs

ENTRYPOINT ["mdl"]
