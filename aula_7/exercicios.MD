# Exercícios de fixação

## Exercícios sobre Horizontal Pod Autoscaler (HPA)

### Exercício 1: Criar um HPA para um Deployment

**Objetivo:** Aprender a configurar um Horizontal Pod Autoscaler para ajustar automaticamente o número de réplicas de um deployment baseado na utilização de CPU.

- **Tarefa:**
  - Crie um deployment com uma imagem que gere carga de CPU, como uma imagem de servidor web Nginx com um loop infinito de cálculos.
  - Configure um HPA para esse deployment para aumentar o número de réplicas quando a utilização média de CPU exceder 50%.

  **Exemplo de arquivo YAML para o Deployment e HPA:**
  ```yaml
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: cpu-intensive-app
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: cpu-intensive-app
    template:
      metadata:
        labels:
          app: cpu-intensive-app
      spec:
        containers:
        - name: nginx
          image: nginx
          command: ["sh", "-c", "while true; do echo 'Load CPU'; done"]
          resources:
            limits:
              cpu: "500m"
            requests:
              cpu: "200m"
  ---
  apiVersion: autoscaling/v1
  kind: HorizontalPodAutoscaler
  metadata:
    name: cpu-intensive-app-hpa
  spec:
    ....
  ```

### Exercício 2: Monitorar e Analisar o Comportamento do HPA

**Objetivo:** Praticar a monitoração e análise de um HPA em ação durante variações de carga.

- **Tarefa:**
  - Gerar carga na aplicação usando uma ferramenta de teste de carga como o Apache Bench ou similar.
  - Observe como o HPA reage à carga, ajustando o número de réplicas do deployment.
  - Use `kubectl get hpa` periodicamente para ver as mudanças na quantidade de réplicas e a utilização de CPU.

## Exercícios sobre Taints e Tolerations

### Exercício 3: Aplicar Taints em um Nó

**Objetivo:** Aprender a aplicar taints em um nó para controlar que pods podem ser agendados nele.

- **Tarefa:**
  - Aplique um taint a um nó usando `kubectl taint nodes <node-name> key=value:taint-effect`, onde `taint-effect` pode ser `NoSchedule`, `PreferNoSchedule`, ou `NoExecute`.
  - Tente agendar um pod simples que não tenha tolerations correspondentes e observe que o pod não é agendado no nó com taint.

### Exercício 4: Configurar Tolerations em Pods

**Objetivo:** Praticar a configuração de tolerations em pods para permitir seu agendamento em nós com taints específicos.

- **Tarefa:**
  - Crie um pod que inclua tolerations correspondentes ao taint aplicado ao nó no exercício anterior.
  - Verifique se o pod é agendado corretamente no nó com o taint.

  **Exemplo de arquivo YAML para o Pod com Tolerations:**
  ```yaml
  apiVersion: v1
  kind: Pod
  metadata:
    name: tolerant-pod
  spec:
    containers:
    - name: nginx
      image: nginx
    tolerations:
    ....
  ```
