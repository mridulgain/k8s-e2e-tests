FROM golang
COPY src/ /root/
# install kubetest
WORKDIR /root/test-infra/
RUN GO111MODULE=on go install ./kubetest
#
WORKDIR /root/kubernetes 
ENV KUBECONFIG=/root/.kube/config
ENTRYPOINT ["kubetest"]
CMD ["--help"]
