![](media/image1.png){width="8.314814085739282in"
height="4.677083333333333in"}

# Lab 4. Serviços de Armazenamento em Nuvem

**Block Storage**

Objetivos

> • Crie um volume de Block Storage de 500GB e anexe o Block Storage a
> uma Instância de Computação

**Criando volumes de Block Storage**

Você pode criar volumes de Block Storage por meio da interface "Block
Storage".

# [EXERCÍCIO 4A: Criando um volume de Block Storage]{.underline}

+-----------------------------------------------------------------------+
| **PASSO 1 -** Para acessá-lo: No menu principal, você escolhe Block   |
| Storage, depois "Block Volume".                                       |
|                                                                       |
| ![](media/image2.png){width="6.883141951006124in"                     |
| height="2.6577668416447944in"}                                        |
|                                                                       |
| **PASSO 2 -** O processo de criação do volume do bloco é muito        |
| simples, você só precisa clicar em \"Create Block Volume\" e          |
| preencher as informações solicitadas:                                 |
|                                                                       |
| > **Name: block_vol500GB**                                            |
| >                                                                     |
| > **Create in Compartment**: \<Your Compartment\>                     |
| >                                                                     |
| > **Virtual Cloud Network**: \<Your VCN\>                             |
| >                                                                     |
| > **Availability Domain**: AD 1                                       |
| >                                                                     |
| > **Size**: 500 GB                                                    |
| >                                                                     |
| > **Backup Policy**: Bronze                                           |
| >                                                                     |
| > **Volume Performance**: Balanced                                    |
|                                                                       |
| -   **IMPORTANTE**: O Block Storage **NECESSITA** estar no mesmo      |
|     domínio de disponibilidade (AD) da Instância de Computação que    |
|     será anexado. No caso iremos anexá-lo à VM Linux 1 criada no      |
|     AD 1. portanto **certifique-se que Block Volume está no mesmo AD  |
|     da sua VM.**                                                      |
|                                                                       |
| ![](media/image3.png){width="5.945857392825896in"                     |
| height="6.529827209098863in"}                                         |
|                                                                       |
| Após a configuração, o OCI começará o provisionamento. O tempo de     |
| provisionamento depende do tamanho do volume.                         |
|                                                                       |
| ##                                                                    |
|                                                                       |
| ##                                                                    |
|                                                                       |
| ##                                                                    |
|                                                                       |
| ##                                                                    |
|                                                                       |
| ##                                                                    |
|                                                                       |
| **Conectando Block Volume a uma Instância de Computação**             |
|                                                                       |
| **PASSO 3 -** Para conectar Block Volumes a instâncias de computação, |
| você precisa acessar a tela inicial \"Compute Instance\" e, na página |
| de detalhes da VM, clicar em \"Attach Block Volume\".                 |
|                                                                       |
| ![](media/image4.png){width="7.018732502187227in"                     |
| height="7.197038495188101in"}                                         |
|                                                                       |
| **PASSO 4 -** Aanexe o Block Volume de 500 GB                         |
| ![](media/image5.png){width="6.15625in" height="6.270253718285215in"} |
|                                                                       |
| Assim que o disco estiver devidamente conectado, podemos montá-lo na  |
| instância de computação.                                              |
|                                                                       |
| **PASSO 5 -** Para facilitar o processo de anexação de disco, o       |
| Oracle Cloud Infrastructure fornece os comandos necessários para      |
| detectar o novo disco da VM. No lado direito das informações do       |
| disco, você encontrará um menu de três pontos.                        |
|                                                                       |
| ![](media/image6.png){width="6.191878827646544in"                     |
| height="1.6481977252843394in"}                                        |
|                                                                       |
| Se você escolher "iSCSI Commands & Information", obterá os comandos   |
| necessários para detectar o disco recém-criado:                       |
|                                                                       |
| ![](media/image7.png){width="5.484664260717411in"                     |
| height="4.943815616797901in"}                                         |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ### PASSO 7 - Execute o procedimento para o Block Volume de 500 GB.   |
|                                                                       |
| ### Tudo que voc                                                      |
| ê precisa fazer é copiar os comandos e executá-los no servidor Linux. |
|                                                                       |
| ### A                                                                 |
| pós a detecção do disco, você precisa formatar e montar o novo disco: |
|                                                                       |
| ### Como detectar e mapear discos novos no Linux                      |
|                                                                       |
| ### 1^st^ -- Conecte-se ao                                            |
|  Servidor VM-OracleLinux-AD1 como usuário opc conforme feito no LAB 3 |
|                                                                       |
| ### 2^nd                                                              |
| ^ -- Se torne ROOT user através do comando SUDO: *"\$* sudo su -- *"* |
|                                                                       |
| ### 3^rd^ -- E                                                        |
| xecute o "ATTACH commands" copiado do "iSCSI Commands & Information": |
|                                                                       |
| ### ![](media/i                                                       |
| mage8.png){width="11.52829615048119in" height="1.0854866579177602in"} |
|                                                                       |
| ### 4^th^ - Detecte o novo dispositiv                                 |
| o com o comando: *"\$* fdisk -l*"*, Você verá a seguinte informação:  |
|                                                                       |
| ### ![](media/                                                        |
| image9.png){width="5.044791119860018in" height="2.671837270341207in"} |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ###                                                                   |
|                                                                       |
| ### 5^th^ -- Formate o disco com o comando: "mkfs /dev/sdb"           |
|                                                                       |
| ### ![](media/im                                                      |
| age10.png){width="6.249027777777778in" height="1.7527744969378827in"} |
|                                                                       |
| ### 6^th^ -- Após o disco ter sido formatado, c                       |
| rie um diretório dentro do linux para ser usado como um ponto de mont |
| agem para o novo volume de disco com o comando: *"*mkdir /vol500g*"*  |
|                                                                       |
| ### ![](media/im                                                      |
| age11.png){width="4.041422790901137in" height="0.7719564741907261in"} |
|                                                                       |
| ### 7                                                                 |
| ^th^ -- Monte o novo volume de disco com o comando: "mount /dev/sdb / |
| vol500g", e cheque se o disco está disponível com o comando: "df -h"  |
|                                                                       |
| ### ![](media/i                                                       |
| mage12.png){width="5.700867235345582in" height="2.983011811023622in"} |
+=======================================================================+
+-----------------------------------------------------------------------+

**Testando a performance do Block Volume**

De acordo com nossa documentação, o desempenho do Volume do Bloco pode
variar de 3.000 IOPS a 300.000 IOPS de acordo com o tamanho do disco. No
próximo teste, vamos testar o desempenho fornecido pelo Volume de Bloco
provisionado.

# [EXERCÍCIO 4B: Testando a performance do Block Volume]{.underline}

+-----------------------------------------------------------------------+
| **PASSO 1 -** Teste o desempenho do Block Volume já provisionado      |
| (**/dev / sdb**):                                                     |
|                                                                       |
| 1 - Instale o utilitário FIO na instância Linux Compute criada        |
| recentemente: (como usuário ROOT, emita o comando: "**yum install fio |
| -y**") ![](media/image13.png){width="6.38629593175853in"              |
| height="1.6                                                           |
| 577187226596675in"}![](media/image14.png){width="5.968798118985127in" |
| height="1.1364271653543307in"}                                        |
|                                                                       |
| 2 -- Rode o utilitário FIO no novo disco (1 TB) usando o comando:     |
|                                                                       |
| **sudo fio \--filename=/dev/sdb \--direct=1 \--rw=randread \--bs=8k   |
| \\**                                                                  |
|                                                                       |
| **\--ioengine=libaio \--iodepth=256 \--runtime=30 \--numjobs=4        |
| \--time_based \\**                                                    |
|                                                                       |
| **\--group_reporting \--name=iops-test-job \--eta-newline=1           |
| \--readonly**                                                         |
|                                                                       |
| ![A close up of text on a white background Description automatically  |
| generated](media/image15.png){width="6.263888888888889in"             |
| height="0.7868055555555555in"}                                        |
+=======================================================================+
+-----------------------------------------------------------------------+

## 

**Configurando Políticas de Backup para Block Storage**

Objetivos

-   Criar Políticas de Backup

No Oracle Cloud Infrastructure, Block Volume (incluindo volumes de
inicialização -- Boot Volumes) e backups Compute Nodes são
independentes. As políticas de backup podem ser definidas na página
inicial do Block Storage (Menu Principal\> Block Storage\> Block
Volumes):

![](media/image16.jpg){width="6.247100831146107in"
height="2.122886045494313in"}

As opções de backup podem ser facilmente acessadas a partir do "menu
rápido" (três pontos à direita), opção "Assign Backup Policy" onde você
pode escolher a política de backup mais apropriada para seus dados.

![](media/image17.png){width="5.763888888888889in"
height="2.8305555555555557in"}

![](media/image1.png){width="8.550043744531933in"
height="4.809399606299213in"}

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
principal usada para dados do serviço [[Archive
Storage]{.underline}](https://docs.oracle.com/pt-br/iaas/Content/Archive/Concepts/archivestorageoverview.htm#Overview_of_Archive_Storage).
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

# [EXERCÍCIO 5: Criar um Object Storage e um site estático]{.underline}

+-----------------------------------------------------------------------+
| **PASSO 1** -- Acesse a tela de Object Storage através do menu        |
| principal \>Object Storage e Archive Storage\> Buckets                |
|                                                                       |
| ![](media/image18.png){width="6.153622047244094in"                    |
| height="2.0875918635170603in"}**[\                                    |
| ]{.underline}**                                                       |
|                                                                       |
| **PASSO 2** -- Selecione o compartimento desejado e clique em "Create |
| Bucket"                                                               |
|                                                                       |
| ![](media/image19.png){width="6.263888888888889in"                    |
| height="2.2618055555555556in"}**[\                                    |
| ]{.underline}**                                                       |
|                                                                       |
| **PASSO 3** -- Crie o Bucket com as seguintes configurações:          |
|                                                                       |
| > **Bucket Name**: bucket-site                                        |
| >                                                                     |
| > **Default Storage Tier**: Standard                                  |
| >                                                                     |
| > **Enable Object Versioning**: V                                     |
|                                                                       |
| ![](media/image20.png){width="6.263888888888889in" height="6.2in"}    |
|                                                                       |
| **PASSO 3** -- A criação será instantânea e você já verá as           |
| informações do seu Bucket:                                            |
|                                                                       |
| ![](media/image21.png){width="6.102495625546807in"                    |
| height="1.6620614610673665in"}                                        |
|                                                                       |
| Selecione o seu novo bucket para ver suas configurações               |
|                                                                       |
| **PASSO 4** -- Agora, vamos alterar a visibilidade do bucket de       |
| "Privado" para "Público":                                             |
|                                                                       |
| ![](media/image22.png){width="5.148997156605424in"                    |
| height="2.233135389326334in"}                                         |
|                                                                       |
| **Não deixe habilitada** a opção de liberar para os usuários listarem |
| os objetos do bucket                                                  |
|                                                                       |
| ![](media/image23.png){width="5.044347112860892in"                    |
| height="4.05076334208224in"}                                          |
|                                                                       |
| Salve as alterações                                                   |
|                                                                       |
| **PASSO 5** -- Faça o UPLOAD do arquivo "index.html" presente no      |
| material de apoio deste workshop.                                     |
|                                                                       |
| Para fazer UPLOAD de arquivos diretamente da console, basta clicar no |
| botão Upload e selecionar o arquivo.                                  |
|                                                                       |
| ![](media/image24.png){width="4.252069116360455in"                    |
| height="1.8963932633420821in"}                                        |
|                                                                       |
| Não será necessário preencher nenhum campo. Apenas selecione o        |
| arquivo e faça o upload                                               |
|                                                                       |
| ![](media/image25.png){width="5.460538057742782in"                    |
| height="4.022756999125109in"}                                         |
|                                                                       |
| **PASSO 6** -- O arquivo aparecerá na sessão Objects do seu Bucket.   |
| Agora para puxar o endereço https deste recurso basta selecionar os 3 |
| pontos na lateral do objeto e selecionar "View Object Details"        |
|                                                                       |
| ![](media/image26.png){width="6.140130139982502in"                    |
| height="2.830152012248469in"}                                         |
|                                                                       |
| **PASSO 7** -- Copie o endereço HTTP abaixo e cole no seu browser     |
| para ver o seu site estático funcionando.                             |
|                                                                       |
| ![](media/image27.png){width="4.419703630796151in"                    |
| height="1.8012007874015747in"}                                        |
|                                                                       |
| Seu site está pronto, agora basta fazer o apontamento em seu DNS      |
|                                                                       |
| ![](media/image28.png){width="3.515204505686789in"                    |
| height="3.1987576552930883in"}                                        |
+=======================================================================+
+-----------------------------------------------------------------------+
