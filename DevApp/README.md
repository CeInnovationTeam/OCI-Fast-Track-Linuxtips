# DevApp

- [Resource Manager](#Resource-Manager)
- [Container Registry (OCIR)](#container-registry-ocir)
- [Functions](#functions)
- [API Gateway](#api-gateway)
- [Kubernetes](#kubernetes) 

## Resource Manager

Serviço que permite a automatização do provisionamento de infraestrutura no OCI através de Terraform.

Pode ser utilizando tanto para importar e criar uma infraestrutura nova de arquivos Terraform, quanto para exportar, como arquivos Terraform, uma estrutura já configurada em um determinado compartimento.

Através dele é possível realizar os jobs do Terraform: **Plan**, **Apply**, **Destroy** e **Import State**.

Documentação: https://docs.oracle.com/en-us/iaas/Content/ResourceManager/home.htm

### Demonstração

Importar as configurações de Terraform para o resource manager e executar os jobs de Plan e Apply.

1. Download

Faça o download do aquivo .zip [aqui](https://github.com/ChristoPedro/fasttrackdevops/raw/main/terraform/terraform.zip).

2. Navegue no menu do OCI Developer Services -> Resource Manager -> Stacks

3. Crie uma nova Stack, selecionando My Configuration e selecione o arquivo baixado anteriormente.

## Container Registry (OCIR)

Baseado no Open Container Iniciative é o repositório que pode ser utilizado para armazenar imagens de container (como Docker images) e criar repositórios tanto **públicos** quando **privados**.

Ele é integrado com o IAM do OCI, e os usuário se autenticam através do nome de usuário da conta do OCI e o token de autenticação.

No repositório também pode ser ativada a função de escanear vulnerabilidades das imagens armazenadas. Essa função retornas os uma lista com os códigos CVE, junto com sua descrição e nível de risco.

Documentação: https://docs.oracle.com/en-us/iaas/Content/Registry/home.htm

### Demonstração

1. Navegue até o OCIR: Developer Service -> Container & Artifacts -> Container Registry.

2. No compartimento criado pelo Resource Manager, crie um novo repositório.

## Functions

Serviço gerenciado de função como serviço no modelo serveless. Baseado no [Fn Project](https://fnproject.io/), que cria funções baseadas em containers.

As linguagens suportadas no OCI são:

- Java
- Go
- NodeJs
- Python
- Ruby

Na comunidade encontramos também suporte para dotNET.

As funções pode ser invocadas através de:

- fn-cli (Linha de comando do Fn Project)
- Rest API
- oci-cli
- SDK do OCI

Documentação: https://docs.oracle.com/en-us/iaas/Content/Functions/home.htm

### Demonstração

1. Navegar até a aplicação que foi criada através do Resource Manager: Developer Services -> Functions -> Application

2. Entre na aplicação criada pelo Resource Manager e siga o **Getting Started**, para criar uma função na aplicação, utilizando o cloud shell.

## API Gateway

API Gateway é a ferramenta que permite expor seus endpoints que estão em redes privadas na internet. O serviço permite adicionar validação, transformação de request e response, CORS, autenticação e autorização e limite de chamadas.

Aceita como backend para as rotas:

- HTTP
- Functions
- Stock Response

Pode ser configuradas autenticação:

- JWT
- Custon (utilizando Functions)

Permite trazer o próprio TLS e habilitar autorização do tipo mTLS.

Documentação: https://docs.oracle.com/en-us/iaas/Content/APIGateway/home.htm

### Demonstração

1. Navegar até o API Gateway criado pelo Resource Manager: Developer Services -> API Management -> Gateways

2. No gateway já criado, criar um novo deployment

3. Configurar o deployment para ter um path apontando para a function criada no passo anterior

## Kubernetes
 O Oracle Cloud Infrastructure Container Engine for Kubernetes (OKE) é um serviço de Kubernetes totalmente gerenciado, escalável e altamente disponível que você pode usar para implantar seus aplicativos de contêineres na nuvem. 
 Um dos grande destaques do serviço é ele não possuir nenhuma customização pré-instalada, fazendo com que o cluster seja compatível com qualquer implementação homologada de Kubernetes. Outro fator importante é a capacidade do serviço ser provisionado nos mais variados tipos de instância, sejam elas Bare Metal, VMs, Instâncias que possuem GPU, ou processadores ARM por exemplo.

 Caracteristicas da plataforma:
 - S.O dos worker nodes são baseados em Oracle Linux (Distro baseada em CentOS), podendo este ser personalizado.
 - Suporte a consumo de serviços nativos de nuvem, como Load Balancer, Armazenamento (Persistent volume claims) de forma nativa
 - Suporte a extensão de serviços (Custom Resource Definition) como Object Storages, ou Bases de Dados de Plataforma (Autonomous Databases, MySQL as a Service)
 - Suporte a autoscaling 

 Documentação: https://docs.oracle.com/pt-br/iaas/Content/ContEng/home.htm

 ### Demonstração

1. Navegar até o Serviço de OKE criado pelo Resource Manager: Developer Services -> Containers & Artifacts -> Kubernetes Clusters (OKE)
2. No cluster já criado, acessar utilizando via cloud shell
3. Crie um novo arquivo no cloud shell chamado nginx_lb.yaml e copie o conteúdo do arquivo [nginx_lb.yaml](nginx_lb.yaml) presente nesse repositório
4. Para criar a implantação e o serviço definidos em nginx_lb.yaml enquanto estiver conectado ao cluster do Kubernetes, digite o comando:
``` kubectl apply -f nginx_lb.yaml ```
5. O balanceador de carga pode levar alguns minutos para passar do estado pendente para totalmente operacional. Você pode exibir o estado atual do cluster digitando:
``` kubectl get all ```
6. Validar a implementação acessando o IP público do LoadBalancer na porta 80: (Utilize o comando  **kubectl get svc** para listar os serviços disponíveis)