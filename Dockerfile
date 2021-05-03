FROM golang
COPY src/ /root/
# # install Go 1.16
# RUN rm -rf /usr/local/go && \
#     tar -C /usr/local -xzf /root/go1.16.3.linux-amd64.tar.gz && \
#     rm -f go1.16.3.linux-amd64.tar.gz
# ENV PATH=$PATH:/usr/local/go/bin
# install kubetest
WORKDIR /root/test-infra/
RUN GO111MODULE=on go install ./kubetest
#
WORKDIR /root/kubernetes 
ENV KUBECONFIG=/root/.kube/config
ENTRYPOINT ["kubetest"]
CMD ["--help"]
