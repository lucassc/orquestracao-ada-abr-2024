# Exercícios de fixação

Aqui está um exercício prático para ajudar os alunos a entender e trabalhar com **Init Containers** no Kubernetes. Este exercício envolve a configuração de um Pod que utiliza um Init Container para preparar o ambiente antes da execução do container principal.

## Exercício 1: Usando Init Containers para Preparar um Ambiente de Aplicação

**Objetivo:** Aprender a configurar e utilizar Init Containers para realizar tarefas de inicialização antes de iniciar o container principal de um Pod.

### Descrição do Exercício:

1. **Contexto:**
   - Suponha que você tenha uma aplicação que necessita de um arquivo de configuração específico que deve ser gerado ou modificado antes da inicialização da aplicação. O Init Container será usado para criar esse arquivo de configuração.

2. **Criar o Pod com Init Container:**
   - Defina um Pod que inclua um Init Container e um container principal. O Init Container deve criar um arquivo de configuração simples, e o container principal deve ser um servidor web Nginx que utiliza esse arquivo.

3. **Tarefas:**
   - Crie o Pod usando o arquivo YAML fornecido.
   - Após a criação do Pod, o Init Container deve executar primeiro, criando o arquivo `index.html` dentro do volume compartilhado.
   - O container principal (Nginx) então serve o arquivo `index.html` quando solicitado.

4. **Verificar Funcionamento:**
   - Use o comando `kubectl get pods` para verificar o status do Pod e garantir que o Init Container foi executado com sucesso antes do container principal.
   - Entre no container Nginx usando `kubectl exec -it init-demo-pod -c nginx -- /bin/bash` e verifique se o arquivo `index.html` está presente em `/usr/share/nginx/html`.
   - Use `kubectl port-forward init-demo-pod 8080:80` e navegue até `http://localhost:8080` em um navegador para ver o conteúdo servido pelo Nginx.

5. **Discussão:**
   - Discuta como os Init Containers podem ser úteis para preparar o ambiente, configurar permissões, realizar migrações de banco de dados, ou realizar qualquer pré-configuração necessária antes do início do container principal.
   - Explore as diferenças entre um Init Container e um container regular, destacando o uso de recursos compartilhados e ordem de execução.

## Exercício 2: Criar e Configurar um Kubernetes Service

**Objetivo:** Aprender a criar um Kubernetes Service para expor um Deployment como um serviço acessível dentro e fora do cluster.

#### Descrição do Exercício:

1. **Criar um Deployment:**
   - Crie um Deployment que execute uma imagem simples de servidor web, como o Nginx. Configure este Deployment para rodar com pelo menos duas réplicas do pod.

   **Exemplo de arquivo YAML para o Deployment:**
   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx-deployment
   spec:
     replicas: 2
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
       spec:
         containers:
         - name: nginx
           image: nginx:latest
           ports:
           - containerPort: 80
   ```

2. **Criar um Service:**
   - Após criar o Deployment, crie um Service do tipo `LoadBalancer` para expor os pods do Nginx fora do cluster. Este tipo de serviço facilitará o acesso ao aplicativo via um endereço IP externo fornecido pelo provedor de cloud ou pelo ambiente de Kubernetes, se suportado.

   **Exemplo de arquivo YAML para o Service:**
   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: nginx-service
   spec:
     type: LoadBalancer
     selector:
       app: nginx
     ports:
       - protocol: TCP
         port: 80
         targetPort: 80
   ```

3. **Verificar o Acesso ao Service:**
   - Após o serviço estar ativo, utilize o comando `kubectl get services` para encontrar o endereço IP externo associado ao Service. Acesse este endereço IP em um navegador para verificar se o servidor web Nginx está respondendo.

4. **Simulação de Falha e Recuperação:**
   - Simule uma falha eliminando um dos pods do Nginx usando `kubectl delete pod <nome-do-pod>`. Observe como o Kubernetes automaticamente cria um novo pod para manter o número desejado de réplicas.
   - Verifique novamente o acesso ao servidor web para confirmar que o Service continuou funcional e acessível mesmo com a falha de um pod.

5. **Discussão:**
   - Discuta a importância dos Services para proporcionar um ponto de acesso estável aos pods, que podem ser dinamicamente criados e destruídos.
   - Explore como diferentes tipos de Services (ClusterIP, NodePort, LoadBalancer) podem ser usados em diferentes cenários.
