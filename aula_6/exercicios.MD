# Exercícios de fixação

## Exercício 1: Ingress com 1 hostname

Rode o [exemplo-ingress-1-host](./exemplo-ingress-1-host/README.md)

## Exercício 2: Ingress com 2 hostname

Rode o [exemplo-ingress-2-hosts](./exemplo-ingress-2-hosts/README.md)

### Exercício 3: Criar e Monitorar um Kubernetes Job

**Objetivo:** Aprender a criar um Kubernetes Job para executar uma tarefa que precisa ser completada apenas uma vez.

#### Descrição do Exercício:

1. **Criar um Job:**
   - Crie um Job que utilize uma imagem do `busybox` para executar um comando simples, como imprimir uma mensagem no console ou listar arquivos em um diretório específico.

   **Exemplo de arquivo YAML para o Job:**
   ```yaml
   apiVersion: batch/v1
   kind: Job
   metadata:
     name: example-job
   spec:
     template:
       spec:
         containers:
         - name: example
           image: busybox
           command: ["sh", "-c", "echo Hello Kubernetes! && sleep 30"]
         restartPolicy: Never
     backoffLimit: 4
   ```

2. **Monitorar o Job:**
   - Use `kubectl get jobs` para verificar o status do Job.
   - Use `kubectl describe jobs/example-job` para obter mais detalhes sobre a execução do Job.
   - Observe o log do container usando `kubectl logs <nome-do-pod>`.

## Exercício 4: Configurar e Gerenciar um Kubernetes CronJob

**Objetivo:** Aprender a configurar um CronJob para executar tarefas periodicamente de acordo com uma agenda definida.

#### Descrição do Exercício:

1. **Criar um CronJob:**
   - Configure um CronJob que utilize a mesma imagem do `busybox` para executar uma tarefa simples (por exemplo, imprimir a data e hora atual) a cada 5 minutos.

   **Exemplo de arquivo YAML para o CronJob:**
   ```yaml
   apiVersion: batch/v1beta1
   kind: CronJob
   metadata:
     name: example-cronjob
   spec:
     schedule: "*/5 * * * *"
     jobTemplate:
       spec:
         template:
           spec:
             containers:
             - name: example
               image: busybox
               args:
               - /bin/sh
               - -c
               - date; echo Hello from the Kubernetes cluster!
             restartPolicy: OnFailure
   ```

2. **Monitorar o CronJob:**
   - Use `kubectl get cronjobs` para ver o CronJob criado e verificar quando o próximo job será executado.
   - Use `kubectl get jobs` para ver os Jobs que foram criados pelo CronJob.
   - Acesse os logs dos Jobs executados para verificar a saída dos comandos.

## Exercício 5: Requests e Limits - CPU

Rode o [job_cpu.yaml](./job_cpu.yaml) sem a definição de `requests` e `limits` depois rode com `requests` e `limits` e tente identificar a diferença.

## Exercício 6: Requests e Limits - Memory

Rode o [job_memory.yaml](./job_memory.yaml) sem a definição de `requests` e `limits` depois rode com `requests` e `limits` e tente identificar a diferença.
