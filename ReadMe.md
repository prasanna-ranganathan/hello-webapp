### SetUp EKS cluster

Make sure we have the AWS configured, or `AWS_PROFILE`  has been set.

```
cd eks-cluster

terraform init

terraform plan

terraform apply
```

You will get the kubectl config

### Configure KubeConfig

using aws command configure kubectl config

```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

### To test it

kubectl cluster-info
kubectl get ns

kubectl create ns helm-demo
```

### HelloApp install - web deploy

Install our webapp using helm

```
helm install hello-world-app ./helloworld-app --namespace helm-demo
```

Install the webapp on `helm-demo` namespace. web app runs on port 3000 and `Ingress` as been confgured which runs on port 80

use kubectl proxy 
```
kubectl proxy
``` 

or kubectl portforward to load the site
```
kubectl port-forward 8080
```

go to browser and hit 
```
localhost:8080/hello
```
it will print helloworld





