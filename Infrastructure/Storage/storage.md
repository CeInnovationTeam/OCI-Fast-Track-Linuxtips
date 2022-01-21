![](images/Picture1.png)

# Lab 4. Serviços de Armazenamento em Nuvem

**Block Storage**

Objetivos

> • Crie um volume de Block Storage de 500GB e anexe o Block Storage a
> uma Instância de Computação

**Criando volumes de Block Storage**

Você pode criar volumes de Block Storage por meio da interface "Block
Storage".

# [EXERCÍCIO 4A: Criando um volume de Block Storage]
**PASSO 1 -** Para acessá-lo: No menu principal, você escolhe Block   
Storage, depois "Block Volume".                                       
                                                                      
![](images/Picture2.png)
                                                                      
**PASSO 2 -** O processo de criação do volume do bloco é muito        
simples, você só precisa clicar em \"Create Block Volume\" e          
preencher as informações solicitadas:                                 
                                                                      
> **Name: block_vol500GB**                                            
>                                                                     
> **Create in Compartment**: \<Your Compartment\>                     
>                                                                     
> **Virtual Cloud Network**: \<Your VCN\>                             
>                                                                     
> **Availability Domain**: AD 1                                       
>                                                                     
> **Size**: 500 GB                                                    
>                                                                     
> **Backup Policy**: Bronze                                       
>                                                                     
> **Volume Performance**: Balanced                                    
                                                                       
 -   **IMPORTANTE**: O Block Storage **NECESSITA** estar no mesmo      
     domínio de disponibilidade (AD) da Instância de Computação que    
     será anexado. No caso iremos anexá-lo à VM Linux 1 criada no      
     AD 1. portanto **certifique-se que Block Volume está no mesmo AD  
     da sua VM.**                                                      
                                                                       
 ![](images/Picture3.png)
                                                                       
 Após a configuração, o OCI começará o provisionamento. O tempo de     
 provisionamento depende do tamanho do volume.                         
                                                                       
 ##                                                                    
                                                                       
 ##                                                                    
                                                                       
 ##                                                                    
                                                                       
 ##                                                                    
                                                                       
 ##                                                                    
                                                                       
 **Conectando Block Volume a uma Instância de Computação**             
                                                                       
 **PASSO 3 -** Para conectar Block Volumes a instâncias de computação, 
 você precisa acessar a tela inicial \"Compute Instance\" e, na página 
 de detalhes da VM, clicar em \"Attach Block Volume\".                 
                                                                       
![](images/Picture4.png)                                     
                                                                       
 **PASSO 4 -** Aanexe o Block Volume de 500 GB                         
 ![](images/Picture5.png) 
                                                                       
 Assim que o disco estiver devidamente conectado, podemos montá-lo na  
 instância de computação.                                              
                                                                       
 **PASSO 5 -** Para facilitar o processo de anexação de disco, o       
 Oracle Cloud Infrastructure fornece os comandos necessários para      
 detectar o novo disco da VM. No lado direito das informações do       
 disco, você encontrará um menu de três pontos.                        
                                                                       
![](images/Picture6.png)                                  
                                                                       
 Se você escolher "iSCSI Commands & Information", obterá os comandos   
 necessários para detectar o disco recém-criado:                       
                                                                       
![](images/Picture7.png)                                 
                                                                       
                                                             
                                                                       
**PASSO 6 -** Execute o procedimento para o Block Volume de 500 GB.   
                                                                       
 ### Tudo que você precisa fazer é copiar os comandos e executá-los no servidor Linux.                                                               
 Após a detecção do disco, você precisa formatar e montar o novo disco: 
                                                                       
 ### Como detectar e mapear discos novos no Linux                      
                                                                       
 ### 1 -- Conecte-se ao Servidor VM-OracleLinux-AD1 como usuário opc conforme feito no LAB 3 
                                                                       
 ### 2 -- Se torne ROOT user através do comando SUDO: 
 *"\$* sudo su - *"* 
                                                                       
 ### 3 -- Execute o "ATTACH commands" copiado do "iSCSI Commands & Information": 
                                                                       
![](images/Picture8.png)                                                                         
                                                                       
 ### 4 -- Detecte o novo dispositivo com o comando: 
 *"\$* fdisk -l *"* 
 
 Você verá a seguinte informação:  
                                                                       
![](images/Picture9.png)  
                                                                                                                
                                                                       
 ### 5 -- Formate o disco com o comando: 
 "mkfs /dev/sdb"           
                                                                       
![](images/Picture10.png)  
                                                                       
 ### 6 -- Após o disco ter sido formatado, crie um diretório dentro do linux para ser usado como um ponto de montagem para o novo volume de disco com o comando: 
 *"*mkdir /vol500g*"*  
                                                                       
 ![](images/Picture11.png)  
                                                                       
 ### 7 -- Monte o novo volume de disco com o comando: 
 "mount /dev/sdb /vol500g"
 
 e cheque se o disco está disponível com o comando: 
 
 "df -h"  
                                                                       
![](images/Picture12.png)  


**Configurando Políticas de Backup para Block Storage**

Objetivos

-   Criar Políticas de Backup

No Oracle Cloud Infrastructure, Block Volume (incluindo volumes de
inicialização -- Boot Volumes) e backups Compute Nodes são
independentes. As políticas de backup podem ser definidas na página
inicial do Block Storage (Menu Principal\> Block Storage\> Block
Volumes):

![](images/Picture13.jpg)  

As opções de backup podem ser facilmente acessadas a partir do "menu
rápido" (três pontos à direita), opção "Assign Backup Policy" onde você
pode escolher a política de backup mais apropriada para seus dados.

![](images/Picture14.png)

# Lab 5. Object Storage

O serviço Oracle Cloud Infrastructure Object Storage é uma plataforma de
armazenamento de alto desempenho em escala de internet que oferece
durabilidade de dados confiável e econômica. O serviço Object Storage
pode armazenar uma quantidade ilimitada de dados não estruturados de
qualquer tipo de conteúdo, incluindo dados analíticos e conteúdo
avançado, como imagens e vídeos.

Com o serviço Object Storage, você pode armazenar e recuperar dados de
forma segura e protegida diretamente da internet ou de dentro da
plataforma de nuvem. O serviço Object Storage oferece várias [interfaces
de
gerenciamento](https://docs.oracle.com/pt-br/iaas/Content/Object/Concepts/objectstorageoverview.htm#accessways)
que permitem gerenciar facilmente o armazenamento em escala. A
elasticidade da plataforma permite que você comece em pequena escala e
dimensione perfeitamente, sem prejudicar o desempenho ou a
confiabilidade do serviço.

O Object Storage é um serviço regional e não está vinculado a nenhuma
instância de computação específica. Você pode acessar dados de qualquer
lugar dentro ou fora do contexto do Oracle Cloud Infrastructure, desde
que tenha conectividade com a internet e possa acessar um dos pontos
finais do serviço [[Object
Storage]{.underline}](https://docs.oracle.com/iaas/api/#/en/objectstorage/latest/).

**Tiers do Object Storage**

**Standard (HOT)**

A camada **Padrão** é a camada de armazenamento padrão principal usada
para dados do serviço [[Object
Storage]{.underline}](https://docs.oracle.com/pt-br/iaas/Content/Object/Concepts/objectstorageoverview.htm#Overview_of_Object_Storage).
A camada de armazenamento Padrão é o armazenamento \"dinâmico\" usado
para dados que você precisa acessar com rapidez, imediatamente e
frequência. A acessibilidade dos dados e o desempenho justificam um
preço mais alto para armazenar dados no nível Standard.\
Alguns casos de uso principais da camada de armazenamento Padrão incluem
o seguinte:

-   Repositório de conteúdo para dados escaláveis, imagens, logs e vídeo
    acessíveis

-   Repositório para backups acessíveis

-   Repositório de dados para dados do Hadoop/big. Fornece uma
    plataforma de armazenamento escalável para armazenar conjuntos de
    dados de grande porte e operar com perfeição nesses conjuntos de
    dados. O [Conector HDFS para o Serviço Object
    Storage](https://docs.oracle.com/pt-br/iaas/Content/API/SDKDocs/hdfsconnector.htm#hdfs)
    oferece conectividade com vários mecanismos de análise de big data,
    como Apache Spark e MapReduce. Essa conectividade permite que os
    mecanismos de análise trabalhem diretamente com dados armazenados no
    serviço Object Storage. Para obter mais informações, consulte
    [Suporte a
    Hadoop](https://docs.oracle.com/pt-br/iaas/Content/Object/Tasks/hadoopsupport.htm#Hadoop_Support).

**Infrequent Access (COOL)**

A camada **Acesso Não Frequente** é um armazenamento \"resfriado\" usado
para dados que você acessa com pouca frequência, mas que deve estar
disponível imediatamente quando necessário. Os custos de armazenamento
são menores do que **Padrão**.

Se você estiver carregando um objeto em um bucket de camada de
armazenamento padrão Padrão, poderá atribuir explicitamente o objeto à
camada de armazenamento Infrequent Access de menor custo.

A camada Acesso Não Frequente tem um período mínimo de retenção de
armazenamento e taxas de recuperação de dados:

-   O período mínimo de retenção de armazenamento para a camada de
    Acesso Não Frequente é de 31 dias. Se você excluir ou substituir
    objetos na camada Acesso Não Frequente antes que os requisitos de
    retenção sejam atendidos, será cobrado o custo rateado de armazenar
    os dados pelos 31 dias completos.

-   Quando você precisar acessar objetos armazenados nesta camada, será
    cobrada uma taxa de recuperação de dados por GiB.

Alguns casos de uso principais da camada de armazenamento do Infrequent
Access incluem o seguinte:

-   Backups de dados locais

-   Repositório para backups raramente acessados

-   Armazenamento para dados replicados ou copiados de outra região

**Archive (COLD)**

A camada **Arquivo Compactado** é a camada de armazenamento padrão
principal usada para dados do serviço [Archive
Storage](https://docs.oracle.com/pt-br/iaas/Content/Archive/Concepts/archivestorageoverview.htm#Overview_of_Archive_Storage).
A camada de armazenamento de arquivos compactados é um armazenamento
\"frio\" usado para dados raramente ou que raramente acessam, mas que
deve ser retido e preservado por longos períodos.\
\
Os objetos na camada Arquivo Compactado devem ser restaurados antes de
estarem disponíveis para acesso. A economia da camada Arquivo Compactado
compensa o lead time necessário para acessar os dados. No entanto, a
camada Archive tem um período mínimo de retenção de armazenamento e
algumas taxas de armazenamento adicionais:

-   O período mínimo de retenção de armazenamento para a camada de
    Arquivo Compactado é de 90 dias. Se você excluir ou substituir
    objetos na camada Arquivo Compactado antes que os requisitos de
    retenção sejam atendidos, será cobrado o custo rateado de armazenar
    os dados pelos 90 dias completos.

-   Ao restaurar objetos, você está retornando esses objetos para a
    camada Padrão para acesso. Você será cobrado pela camada de classe
    Padrão enquanto os objetos restaurados residirem nessa camada.

Alguns casos de uso principais da camada de armazenamento de Arquivos
Compactados incluem o seguinte:

-   Requisitos de conformidade e auditoria

-   Análise de dados de log retroativo para determinar o padrão de uso
    ou para depurar problemas

-   Dados do repositório de conteúdo histórico ou raramente acessados

-   Dados gerados pelo aplicativo que exigem arquivamento para análise
    futura ou para fins legais

Objetivo

-   Criar um Site estático utilizando um Bucket público

# [EXERCÍCIO 5: Criar um Object Storage e um site estático]

 **PASSO 1** -- Acesse a tela de Object Storage através do menu principal \>Object Storage e Archive Storage\> Buckets                
                                                                       
![](images/Picture15.png)                                                     
                                                                       
 **PASSO 2** -- Selecione o compartimento desejado e clique em "Create 
 Bucket"                                                               
                                                                       
![](images/Picture16.png)                                                    
                                                                       
 **PASSO 3** -- Crie o Bucket com as seguintes configurações:          
                                                                       
 > **Bucket Name**: bucket-site                                        
 >                                                                     
 > **Default Storage Tier**: Standard                                  
 >                                                                     
 > **Enable Object Versioning**: V                                     
                                                                       
![](images/Picture17.png)     
                                                                       
 **PASSO 3** -- A criação será instantânea e você já verá as           
 informações do seu Bucket:                                            
                                                                       
![](images/Picture18.png)                                      
                                                                       
 Selecione o seu novo bucket para ver suas configurações               
                                                                       
 **PASSO 4** -- Agora, vamos alterar a visibilidade do bucket de       
 "Privado" para "Público":                                             
                                                                       
![](images/Picture19.png)                                        
                                                                       
 **Não deixe habilitada** a opção de liberar para os usuários listarem 
 os objetos do bucket                                                  
                                                                       
![](images/Picture20.png)                                         
                                                                       
 Salve as alterações                                                   
                                                                       
 **PASSO 5** -- Faça o UPLOAD do arquivo "index.html" presente no      
 material de apoio deste workshop.                                     
                                                                       
 Para fazer UPLOAD de arquivos diretamente da console, basta clicar no 
 botão Upload e selecionar o arquivo.  

![](images/Picture21.png)                                     
                                                                       
 Não será necessário preencher nenhum campo. Apenas selecione o        
 arquivo e faça o upload                                               
                                                                       
![](images/Picture22.png)                                         
                                                                       
 **PASSO 6** -- O arquivo aparecerá na sessão Objects do seu Bucket.   
 Agora para puxar o endereço https deste recurso basta selecionar os 3 
 pontos na lateral do objeto e selecionar "View Object Details"        
                                                                       
![](images/Picture23.png)                                   
                                                                       
 **PASSO 7** -- Copie o endereço HTTP abaixo e cole no seu browser     
 para ver o seu site estático funcionando.                             
                                                                       
![](images/Picture24.png)                                       
                                                                       
 Seu site está pronto, agora basta fazer o apontamento em seu DNS      

![](images/Picture25.png)  
