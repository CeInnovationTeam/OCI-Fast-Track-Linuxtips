## LAB Compute

Requisitos:
- Compartimento criado
- Rede criada


### Criar chave ssh


Abra o Cloud shell no canto superior direito
Dentro do terminal execute ssh-keygen -t rsa e dê enter até o processo encerrar, não coloque passphrase:

`

    adriano_ta@cloudshell:~ (us-ashburn-1)$ ssh-keygen -t rsa
    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/adriano_ta/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/adriano_ta/.ssh/id_rsa.
    Your public key has been saved in /home/adriano_ta/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:DVk8TenKKy5fHgwsZzLz7sqGBg0tArNrycldAD59qWw adriano_ta@cd8f9900528e
    The key's randomart image is:
    +---[RSA 2048]----+
    | ..      ..o..   |
    |+ ..  .  oo o    |
    |.= o.o  o  o     |
    |o = +. . o  .    |
    |oo+E. = S...     |
    |.*o..  O oo      |
    |.  . .  . +.     |
    |    o.o..o..     |
    |   . .o*=..      |
    +----[SHA256]-----+`

Entre no diretório .ssh e copie o conteúdo do arquivo id_rsa.pub:



    adriano_ta@cloudshell:~ (us-ashburn-1)$ cd .ssh/
    adriano_ta@cloudshell:.ssh (us-ashburn-1)$ cat id_rsa.pub 
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCP+IWY958AvV7E1y56i3AehrSRF8CxrSt9Nn8wXKBp2NjmeiFpnpub+/mI5xmDYCbMIrZCXAEyB1uq6uLJBV70cjX9DfhMo7zGEYL0cJHBwmTkVl/e7vOLx4IeAa9dFj0Hl21IszcODEvaY1vchGCZiVVlgFHD6l7p3BlA5xGcwJg9SkSIUgm61mMsWssoZX1l2CW3AGHpwcnxQfF25HATl63j1Rb4oMmMZ5GHd8cfaRE+BCi+V7n6YgYgHkftZMEo68pgXYkcFmj15YJXs5bDduZlz4990vbBe3yuqhijSVuy7Edap8Y6G3vWCTup5adEVnAyxuSQTnKz5nLoAvrv adriano_ta@cd8f9900528e

![](https://i.imgur.com/4trnHXH.gif)


### Criar VM

**Acessar o menu de Hamburguer -> Compute -> Instance -> Create Instance**

- Name: vm-linuxtips

#### Image And Shape:

- Image: Oracle Linux 7.9
- Shape: VM.Standard.E2.1.Micro

#### Networking

- Primary Network: VCN-Trial
- Subnet: Public-Subnet

#### Add SSH keys

- Paste Public Keys
- Colocar o conteúdo do arquivo id_rsa.pub gerado no Cloud Shell

![](https://i.imgur.com/NOpH57x.gif)


#### Clicar em Create

#### Acessar VM

![](https://i.imgur.com/Gs0Owxv.gif)

