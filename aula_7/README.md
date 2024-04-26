# Aula 7

| Paginas                                  |
| ---------------------------------------- |
| [Links](./links_aula.md)                 |
| [Exercícios de fixação](./exercicios.MD) |


## Conteúdo

- HPA
- Ingress
- Taints e Tolerations
- RBAC



### RBAC - Role Base Access Control


Pedro - Desenvolvedor
USER: Pedro
Maria - Desenvolvedor
USER: MARIA

Anderson - SRE
USER: Anderson


Service Account: 

GRUPO: Desenvolvedores:
  -Acesso RW aos namespaces: dev, tst

GRUPO: SREs:
 - Acesso RW ao namespace: PRD  
 - Acesso RO aos namespaces: dev, tst


ROLE: Security Engineer Reader
   Acesso a leitura de logs de segurança de todos os tipos de recursos

ROLE: ApplicationDeveloper
  - read: Deployment


RECURSO: Deployment do namespace DEV e TST
   GRUPO: Desenvolvedores -> ApplicationDeveloper
   USER: Anderson -> Admin



