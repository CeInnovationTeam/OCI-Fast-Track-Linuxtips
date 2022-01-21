## Lab Monitoring, Events e Notifications


1 – Acessar o menu -> Developer Services -> Application Integration, clicar em Notifications, conforme a imagem abaixo:
![](images/item1.png)

2 – Clicar em Create Topic:
![](images/item2.png)

3 – Preencher o Name e Description com o seguintes valores:
Name: topic_aulao  
Description: Topic criado para receber as notificações de eventos e alarmes do serviços provisionados no OCI.  
![](images/item3.png)

4 – Clicar no botão **Create;**

5 – Com o Topic criado clique em seu nome para acessa-lo:
![](images/item5.png)

6 – Clicar no botão **Create Subscriptions**:
![](images/item6.png)

7 – Em **Protocol** selecionar a opção **E-mail**, e no  Campo E-mail preencher o valor com seu endereço de e-mail: 
![](images/item7.png)


8 – Clicar em **Create**:


9 – Com o a **Subscription** ativada o status estará pendente, vamos dar autorização para que o serviço de notifications do OCI envie notificações para seu e-mail:
![](images/item9.png)

10 – Acessar sua caixa de E-mail e abrir o E-mail com o título **Oracle Cloud Infrastructure Notifications Service Subscription Confirmation**:
![](images/item10.png)

11 – Clicar no link **Confirm Subscription**, você será redirecionado para o navegador onde vai receber a confirmação de subscrição conforme a imagem abaixo:
![](images/item11.png)

11 – Voltar para console do OCI;

12 – Confirmar que o **state** agora está com **Active**:
![](images/item13.png)


13 – Acessar o menu Compute -> Instances e localizar a VM criada no Lab de Compute:
![](images/item14.png)

14 – Selecionar a vm **vm-linuxtips** que você provisionou nos labs anteriores:
![](images/item15.png)

15 – Acessar o link **Metrics** no menu **Resources**:
![](images/item16.png)

16 – Vocês está vendo algumas metricas que podemos monitorar de uma VM;
![](images/item17.png)

17 – Clicar no botão **Options** no quadro **CPU Utilization**:
![](images/item18.png)

18 – Clique na opção **Create an Alarm on this Query**:

19 – Preencher Alarm name, Alarm Body e Alarm severity:

**Alarm name**

baixo uso de cpu

**Alarm Body**

vm de compute com baixo uso de processamento

Alarm severity

**Info**
![](images/item19.png)
  
20 – Utilize o scroll para preencher Metric description conforma a imagem abaixo:
![](images/item20.png)

21 – Em Metric dimensions selecione **resourceid** para **Dimension name** e em dimension value selecione a única opção disponível:

![](images/item21.png)


22 – O preenchimento ficara dessa maneira:
![](images/item22.png)


23 – Em Trigger rule vamos preencher conforme a imagem abaixo:
![](images/item23.png)

24  - A regra que configuramos no Trigger rule significa que toda vez que a utilização de CPU da VM estiver menor que 30% durante pelo menos 1 minuto seremos notificados;

25 – No grafico para guiar essa configuração temos em vermelho a condição que configuramos e em azul histórico da metrica que estamos monitorando. Desta maneira você consegue verificar nas ultimas horas quais seriam as situações que associariam um alarme;
![](images/item25.png)

26 – Em **Destinations** iremos selecionar os valores abaixo escolhendo o **topic_aulao** que criamos nos passos anteriores desse lab;
![](images/item26.png)

27 – Preencher as opções restantes conforme a imagem abaixo marcando a opção **Repeat Notification?,** Notification frequency = 60 minutes**;**
![](images/item27.png)

28 – Clicar em **Save alarm**;

29 – Receba a confirmação da criação do alarme;
![](images/item29.png)

30 – Aguardar um minuto para que alarme seja engatilhado pela condição que escolhemos;

31 – Verificar sua caixa de email com a notificação do alarme:
![](images/item30.png)

31 – Agora temos um monitoramento pro ativo olhando para o processamento de um VM E seremos acionados toda vez que a VM possuir baixo processamento;

32 – Agora vamos configurar Events;

33 – Acessar menu -> **Observability and Management** -> **Events Services** e clicar em **Rules**;
![](images/item33.png)


34 – No mesmo compartimento que já estamos utilizando e que também foi criado no lab de Identity;
![](images/item34.png)

35 – Clicar no botão **Create Rule**;

36 – Preencher Display Name e Description:

**Display Name**

capturar vm's reiniciadas ou desligadas

**Description**

essa regra captura eventos de desligamento e reinicio de vm's

37 – Configure Rule Conditions conforme a imagem abaixo:
![](images/item37.png)

38 – Clique no botão **+ Another Condition**:
![](images/item38.png)

39 – Selecione **Attribute** em **Condition**;

40 – Selecione Attribute Name com o valor **instanceActionType** e adicione os valores **stop** e **reset** digitando o valor e clicando em **<valor-digitado> (New):**
![](images/item40.png)

41 – Ao final a regra deve estar dessa maneira:
![](images/item41.png)


42 – Em **Actions** vamos selecionar o **Type** como **Notification** o **compartimento** que já estamos utilizando e o **Topic** com **topic_aulao;**
![](images/item42.png)

43 – Clicar em **Create Rule**;

44 – Receber a confirmação de que a **Rule** foi criada com sucesso:
![](images/item44.png)

45 – Agora vamos reiniciar uma VM para testar a nossa regra;

46 – Voltar a VM que já haviamos criado menu -> Compute -> instances;
![](images/item46.png)

47 – Clicar no nome da vm **vm-linuxtips**;

48 – Clicar no botão **Stop**:
![](images/item48.png)

49 – Marcar a opção **Force Stop,** e clicar em **Force Stop Instance**;
![](images/item49.png)

50 – Aguardar a chegada do Email;
![](images/item50.png)

51 – Fim, caso voce queira pode ligar a máquina novamente e testar o evento de restart!