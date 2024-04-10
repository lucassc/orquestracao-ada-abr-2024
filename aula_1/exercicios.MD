# Exercícios de fixação

## Exercício 1: Explorar o Cluster Kubernetes

**Objetivo:** Familiarizar-se com o cluster Kubernetes e os comandos básicos do kubectl.

- **Tarefa:**
  - Use o comando `kubectl cluster-info` para visualizar informações sobre o cluster Kubernetes.
  - Execute `kubectl get nodes` para listar todos os nós (nodes) no cluster. Isso ajuda a entender a escala e os recursos disponíveis no cluster.

## Exercício 2: Criar e Gerenciar um Pod Simples

**Objetivo:** Aprender a criar, inspecionar e gerenciar um Pod Kubernetes, a unidade mais básica de implantação.

- **Tarefa:**
  - Crie um Pod que rode um container simples usando a imagem `nginx`. Isso pode ser feito criando um arquivo YAML ou usando o comando `kubectl run`.
  - Utilize `kubectl get pods` para listar os Pods em execução.
  - Inspect o Pod criado utilizando `kubectl describe pod <nome-do-pod>`.
  - Delete o Pod utilizando `kubectl delete pod <nome-do-pod>`.

## Exercício 3: Implantação (Deploy) de uma Aplicação Simples

**Objetivo:** Praticar a criação de uma implantação (Deployment), que permite a replicação e a gestão de múltiplas instâncias de um Pod.

- **Tarefa:**
  - Crie uma implantação usando a imagem `nginx` que mantenha três réplicas do Pod em execução.
  - Use `kubectl get deployments` para ver o status da implantação.
  - Escalar a implantação para cinco réplicas usando `kubectl scale deployment <nome-da-implantação> --replicas=5`.
  - Visualize os Pods adicionais sendo iniciados com `kubectl get pods`.

## Exercício 4: Expor um Pod/Implantação Externamente

**Objetivo:** Aprender a expor um Pod ou uma implantação externamente usando um serviço (Service) para acessar a aplicação fora do cluster Kubernetes.

- **Tarefa:**
  - Exponha a implantação criada no Exercício 3 externamente utilizando um serviço do tipo `LoadBalancer`.
  - Use `kubectl get services` para listar os serviços ativos e encontrar o endereço IP externo do serviço.
  - Acesse a aplicação nginx através do navegador, usando o endereço IP externo fornecido pelo serviço.
