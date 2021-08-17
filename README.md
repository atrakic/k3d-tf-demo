# k3d-tf-demo

![tf-k3d](https://github.com/atrakic/k3d-tf-demo/workflows/tf-k3d/badge.svg)

This repo demonstrates how to install local Helm chart on k3d with Terraform.


## Demo

```
$ helm list
NAME       	NAMESPACE	REVISION	UPDATED                                 	STATUS  	CHART     	APP VERSION
k3d-tf-demo	default  	1       	2021-04-15 23:01:29.722430533 +0200 CEST	deployed	demo-0.1.0	1.16.0

$ kubectl get configmap demo-demo
NAME        DATA   AGE
demo-demo   1      14h
```

For more details see: [Demo](https://github.com/atrakic/k3d-tf-demo/actions),
  [Source action](./.github/workflows/tf-k3d.yml), [K3d config](./k3d.yaml)
