# Start using kubernetes e2e tests without any hectic build process
+ To see all available options run,
```
$ sudo docker run mridulgain/kubetest
```
+ To run all e2e tests on your existing k8s cluster
```
$ sudo docker run -v /path/to/kubeconfig:/root/.kube/config mridulgain/kubetest --test
```
+ Run a specific test, e.g You want to run only [this](https://github.com/kubernetes/kubernetes/blob/release-1.21/test/e2e/network/dual_stack.go) testcase where we check only the dual stack functionality on an existing cluster running k8s v1.21.0.
```
sudo docker run  -v /etc/kubernetes/admin.conf:/root/.kube/config  mridulgain/kubetest:latest  \
--test \
--provider=local \
--extract=v1.21.0 \
--test_args="--ginkgo.focus=\[Feature:IPv6DualStack\]"
```
## Know more about
+ [```Kubetest```](https://github.com/kubernetes/test-infra/tree/master/kubetest), the canonical way to run e2e tests.
+ More examples of ```kubetest``` from [kubernetes community doc](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-testing/e2e-tests.md)
## Repositories in ```src/```
+ [kubernetes](https://github.com/kubernetes/kubernetes)
+ [test-infra](https://github.com/kubernetes/test-infra)
