
#Acessando o Painel da AWS, atraves do serviço IAM, crie um usuário 
#com permissão "AmazonEC2FullAccess"
#Gerando access key e e secret para acessar com essa conta (Baixe seu acesso no botão download .csv)

#Vamos gerar um par de chaves para realizar o acesso na VM via SSH
#No seu computador abra o terminal e execute o comando ssh-keygen
#Escolha um local para armazenar essas chaves
#Escolha uma "pass"  para chave
#Lembre do caminho até essas chaves
#(Caso esteja utilizando Windows, pode baixar o GITbash), pois pode utilizar ele para executar o terraform.

#Baixe o terraform e instale de acordo com seu SO.

#Em seguida criar os arquivos de acordo com os comentarios#:
#main.tf (arquivo de provisionamento da dos recursos), 
#variables.tf (Descrição de variaveis utilizadas no main.tf), 
#terraform.tfvars ("Conteudo das variaveis")
#init-script.sh (script de inicialização da VM)

#Abrir o terminal na pasta de trabalho com todos os arquivos acima e executar os comandos:

#terraform init # Para iniciar o terraform na pasta de trabalho

#terraform plan # Para realizar o planejamento do provisionamento de recursos

#terraform apply # Para executar o provisionamento de todos os recursos.


