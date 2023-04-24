# petclinic-argocd

## Prequisite
Local에서 실행하기 위해 설치가 필요합니다.
- docker
- kubectl
- minikube

## Installation
순서대로 아래의 항목들을 설치합니다. Mac, arm 기준입니다.

### Minikube
아래 Command를 통해 설치합니다. docker가 설치되어 있어야 합니다.
```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-arm64
sudo install minikube-darwin-arm64 /usr/local/bin/minikube

```
[참고] https://minikube.sigs.k8s.io/docs/start/
설치가 완료되면 실행합니다.
```shell
minikube start
```

### ArgoCD
argocd namespace를 생성합니다.
```shell
kubectl create ns argocd
```
Minikube cluster에 ArgoCD를 설치합니다.
```shell
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.5.8/manifests/install.yaml
```
### ArgoCD Application
argocd-app directory에서 아래의 command를 실행하여 ArgoCD application을 생성합니다.
```shell
k apply -f nginx-ingress-controller.yaml
k apply -f petclinic-app-argocd.yaml
k apply -f petclinic-db-argocd.yaml
```
초기 비밀번호를 얻습니다.
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
Port-Forward를 통해 UI에 접근하여, 정상적으로 생성됐는지 확인합니다.
```shell
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
정상적으로 생성 된 경우 아래와 같이 표시되게 됩니다.
![alt text] (https://cookie-tomato-400.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fda9f85b4-34a2-4e93-b9f4-fc52242c2f73%2F%25E1%2584%2589%25E1%2585%25B3%25E1%2584%258F%25E1%2585%25B3%25E1%2584%2585%25E1%2585%25B5%25E1%2586%25AB%25E1%2584%2589%25E1%2585%25A3%25E1%2586%25BA_2023-04-24_%25E1%2584%258B%25E1%2585%25A9%25E1%2584%2592%25E1%2585%25AE_10.42.16.png?id=53252f79-049b-49eb-9868-94cab4720622&table=block&spaceId=b3b35dfb-f3f4-4329-aa95-d9a44fd05422&width=2000&userId=&cache=v2)

정상적으로 생성이 안 된 경우, 아래의 Settings/Clusters에 들어가 아래와 같이 cluster name이 minikube인지, cluster와 연결상태가 정상인지 확인합니다.
![alt text](https://cookie-tomato-400.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6aedeb57-4acf-4323-9b33-4e47eda53de3%2F%25E1%2584%2589%25E1%2585%25B3%25E1%2584%258F%25E1%2585%25B3%25E1%2584%2585%25E1%2585%25B5%25E1%2586%25AB%25E1%2584%2589%25E1%2585%25A3%25E1%2586%25BA_2023-04-24_%25E1%2584%258B%25E1%2585%25A9%25E1%2584%2592%25E1%2585%25AE_10.38.39.png?id=3ba3ab02-c2f6-48e2-bd27-b749da5968c9&table=block&spaceId=b3b35dfb-f3f4-4329-aa95-d9a44fd05422&width=2000&userId=&cache=v2)

## Deploy
- 5분 간격으로 동기화하여 배포됩니다.
- 수동으로 할 경우, Refresh를 통해 최신 소스로 업데이트하여 Sync합니다.



