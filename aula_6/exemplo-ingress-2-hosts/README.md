# exemplo-ingress-2-host2

```BASH
kubectl apply -f namespace.yaml
kubectl apply -f .
```

**Importante**: Atualize o seu arquivo hosts

```
<ip> meu-app-1.com
<ip> meu-app-2.com
```

**Importante**: Se você está utilizando `nginx` ingress controller, atualize a linha 7 dos arquivos
[ingress-app-1](./ingress-app-1.yaml) e [ingress-app-2](./ingress-app-2.yaml)


- [meu-app-1](http://meu-app-1.com) 
- [meu-app-2](http://meu-app-2.com) 
