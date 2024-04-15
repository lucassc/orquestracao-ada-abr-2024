# Exercícios de fixação

## Exercício 1: Atualizar um Deployment

```BASH
k create deploy exercicio-1-dia-2 --image=nginx:1.17 --port 80 --dry-run=client -oyaml

k create -f exercicio-1.yaml

# para ultima versao
kubectl rollout undo deployment exercicio-1-dia-2  --to-revision=0
```

## Exercício 3: Configurar um DaemonSet

```BASH
## Change the output to daemonSet
k create deploy exercicio-3-dia-2 --image=busybox --port 80 --dry-run=client -oyaml -- sleep 3600

k create -f exercicio-2.yaml

```