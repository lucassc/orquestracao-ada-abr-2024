# Exercícios de fixação

## Exercício 1: Uso de ConfigMap para Configurar Variáveis de Ambiente em um Pod

Objetivo: Aprender a criar um ConfigMap no Kubernetes e usá-lo para fornecer configurações como variáveis de ambiente para um Pod.
Descrição do Exercício:

**Criar um ConfigMap:**

Crie um ConfigMap chamado app-config que contém as seguintes configurações:
- `APP_COLOR` com o valor `blue`
- `APP_MODE` com o valor `prod`

## Exercício 2: Uso de Secrets Montados como Volume em um Pod

Objetivo: Aprender a criar um Secret no Kubernetes e montá-lo como um volume dentro de um Pod para proteger informações confidenciais.
Descrição do Exercício:

**Criar um Secret:**

Crie um Secret chamado app-secrets que contém duas informações sensíveis:
- `username` com o valor `user123`
- `password` com o valor `safePassword123`

**Verificar a Montagem do Secret:**

Após criar o Pod, verifique se o Secret foi montado corretamente acessando o shell do container e listando os conteúdos de `/etc/secrets`.

## Exercício 3: Configuração de um Ingress para Acesso a Múltiplos Serviços

Objetivo: Aprender a configurar um Ingress para rotear tráfego externo para múltiplos serviços internos de um cluster Kubernetes.
Descrição do Exercício:

**Preparar o Ambiente:**

Certifique-se de que o Ingress Controller (por exemplo, Nginx Ingress Controller) está instalado no cluster. Se necessário, instale-o seguindo a documentação oficial.

**Criar Dois Serviços Simples:**

Crie dois deployments: um para um servidor web Nginx e outro para uma aplicação Hello World (pode ser outra imagem simples de servidor web).
Exponha ambos os deployments como serviços usando o tipo ClusterIP.
