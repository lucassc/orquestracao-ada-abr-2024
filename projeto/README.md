# Projeto: Implementação Kubernetes para Detecção de Fraudes Bancárias

## Contexto

A equipe ACME, após implementar com sucesso um sistema de detecção de fraudes bancárias usando Docker e serviços como Redis e RabbitMQ para processamento assíncrono de transações e armazenamento em cache, agora busca melhorar a disponibilidade, escalabilidade, e resiliência deste sistema em um ambiente de produção real. Com o crescimento exponencial no volume de transações processadas, tornou-se crítico garantir que o sistema possa escalar de forma eficiente e manter alta disponibilidade, mesmo frente a falhas de componentes individuais ou picos inesperados de demanda.

## Objetivo

O projeto deste módulo consistirá na migração e adaptação do sistema existente para funcionar dentro de um cluster Kubernetes, aproveitando recursos como gerenciamento de configuração, auto-scaling, e self-healing para garantir que o sistema possa lidar com um volume crescente de transações sem degradação de performance ou disponibilidade.

## Requisitos

1. **Kubernetes Cluster**: Configuração de um cluster Kubernetes que hospedará todos os componentes do sistema, incluindo a aplicação de detecção de fraudes, Redis, RabbitMQ, e Minio.

2. **Deployment de Serviços**:
    - Crie deployments Kubernetes para cada um dos serviços mencionados, garantindo que eles possam ser escalados horizontalmente conforme necessário.
    - Utilize ConfigMaps e Secrets para gerenciar configurações sensíveis e não-sensíveis separadamente.

3. **Persistência de Dados**:
    - Implemente Persistent Volumes (PVs) e Persistent Volume Claims (PVCs) para garantir a persistência de dados críticos, como o armazenamento de objetos do Minio e a base de dados do Redis.

4. **Network e Exposição de Serviços**:
    - Defina e configure adequadamente os serviços Kubernetes (LoadBalancers, NodePorts, etc.) para garantir a comunicação eficaz entre os componentes do sistema e a exposição segura da aplicação ao mundo externo.

5. **Documentação**:
    - Forneça uma documentação detalhada do projeto, incluindo a arquitetura do sistema, como configurar e lançar o cluster Kubernetes, e como escalar os serviços conforme necessário.

## Entrega

O projeto deve ser entregue em um repositório no GitHub contendo todos os arquivos de configuração do Kubernetes, scripts de deploy, e a documentação. A documentação deve incluir instruções passo a passo sobre como configurar o ambiente, implantar a aplicação, e validar a implementação.

## Opcional

- Uso de Helm Charts para empacotamento das aplicações
- Implemente soluções de monitoramento e logging para acompanhar o estado do cluster e dos aplicativos, facilitando a detecção e a solução de problemas.

## Avaliação

Os projetos serão avaliados com base na correta implementação dos requisitos, na qualidade da documentação fornecida, e na eficácia com que o sistema implementado atende às demandas de escalabilidade, disponibilidade, e resiliência em um ambiente de produção real.
