# Desafio de Provisionamento na AWS com Terraform

Este desafio faz parte de uma capacitação e tem como objetivo a criação de recursos e uma VM na AWS de forma automatizada pelo Terraform, já configurando um ambiente para executar o WordPress com banco de dados via Docker. A máquina ficará pronta para ser acessada via HTTP e configurar um site WordPress.

## Passos para a Configuração

### 1. Criar Usuário na AWS
- Acesse o painel da AWS e navegue até o serviço **IAM**.
- Crie um usuário com a permissão **AmazonEC2FullAccess**.
- Gere uma **access key** e uma **secret key**. Não esqueça de baixar o arquivo `.csv` com suas credenciais.

### 2. Gerar Par de Chaves para Acesso SSH
- Abra o terminal no seu computador e execute o seguinte comando:
  ```bash
  ssh-keygen

Escolha um local para armazenar essas chaves.

Defina uma passphrase para a chave.

Lembre-se do caminho até essas chaves.

Obs: Se estiver utilizando Windows, você pode baixar o Git Bash para executar os comandos.

3. Instalar o Terraform
Baixe o Terraform e instale-o de acordo com seu sistema operacional.
4. Criar os Arquivos Necessários
Crie os seguintes arquivos em sua pasta de trabalho:
- main.tf: arquivo de provisionamento dos recursos.
- variables.tf: descrição das variáveis utilizadas no main.tf.
- terraform.tfvars: conteúdo das variáveis.
- init-script.sh: script de inicialização da VM.
5. faça as devidas alterações para seus dados em terraform.tfvars.
6. Executar os Comandos Terraform
Abra o terminal na pasta de trabalho onde estão todos os arquivos criados e execute os seguintes comandos:


- terraform init   # Para iniciar o Terraform na pasta de trabalho
- terraform plan   # Para realizar o planejamento do provisionamento de recursos
- terraform apply  # Para executar o provisionamento de todos os recursos



