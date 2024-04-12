# Exercícios de fixação


## Exercício 1: Atualizar um Deployment

**Objetivo:** Aprender a atualizar uma aplicação em execução dentro de um Deployment e praticar o gerenciamento de versões.

- **Tarefa:**
  - Crie um Deployment utilizando a imagem `nginx:1.17`.
  - Após confirmar que o Deployment está rodando corretamente, atualize a imagem do Deployment para `nginx:1.18`.
  - Use o comando `kubectl rollout status deployment/<nome-do-deployment>` para monitorar o status da atualização.
  - Verifique o histórico de rollouts com `kubectl rollout history deployment/<nome-do-deployment>` e discuta como o Kubernetes gerencia o versionamento de Deployments.

## Exercício 2: Rollback de um Deployment

**Objetivo:** Praticar como reverter um Deployment para uma versão anterior em caso de falhas ou problemas com uma nova versão da aplicação.

- **Tarefa:**
  - Após atualizar o Deployment no Exercício 1, simule um erro ou problema na nova versão da aplicação.
  - Realize um rollback para a versão anterior usando `kubectl rollout undo deployment/<nome-do-deployment>`.
  - Verifique se a aplicação voltou para a versão anterior corretamente e discuta a importância do gerenciamento de versões.

## Exercício 3: Configurar um DaemonSet

**Objetivo:** Aprender a usar DaemonSets para garantir que cada nó do cluster execute uma cópia de um Pod específico.

- **Tarefa:**
  - Crie um DaemonSet que utilize a imagem `busybox` para rodar um contêiner que simplesmente executa o comando `sleep 3600`.
  - Verifique que o DaemonSet implantou um Pod em cada nó do cluster utilizando `kubectl get pods -o wide`.
  - Discuta os casos de uso de um DaemonSet, como por exemplo, a execução de um agente de coleta de logs em todos os nós.

## Exercício 4: Escalar um Deployment Dinamicamente

**Objetivo:** Explorar a escalabilidade dinâmica de Deployments com base em métricas de uso, como a CPU.

- **Tarefa:**
  - Configure um Horizontal Pod Autoscaler para o Deployment criado nos exercícios anteriores. Este HPA deve aumentar o número de réplicas quando a carga de CPU ultrapassar 50%.
  - Gere carga usando um loop infinito de requisições HTTP para a aplicação nginx para testar o autoscaling.
  - Observe como o número de Pods aumenta conforme a carga e discuta o comportamento do autoscaling em ambientes de produção.
