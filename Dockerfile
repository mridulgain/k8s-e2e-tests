FROM ubuntu
COPY src/ /root/
# install Go 1.16
RUN rm -rf /usr/local/go && \
    tar -C /usr/local -xzf /root/go1.16.3.linux-amd64.tar.gz && \
    rm -f go1.16.3.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=/root
# install kubetest
WORKDIR /root/test-infra/kubetest
RUN go install .
ENV PATH=$PATH:$GOPATH/bin
#
WORKDIR /root/kubernetes 
ENV KUBECONFIG=$HOME/.kube/config
ENTRYPOINT ["kubetest", "--test",  "--provider=local"]
CMD ["--extract=v1.21.0", "--test_args=\"--ginkgo.focus=\[Feature:IPv6DualStack\]\""]
