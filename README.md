## Este projeto demonstra a criação de uma aplicação Flask básica com automação via script shell.
### Descrição escrita pelo desenvolvedor após todo o processo automatizado.<br>
O projeto foi criado com o auxílio de uma ferramenta de LLM [(Google Gemini)](https://gemini.google.com/?hl=en-GB)<br>

**Processos automatizados**
* Criação de pasta, ambiente virtual e arquivos do projeto
* Escrita de código e teste automatizado
* Repositório do Git e commits
* Criar uma documentação básica
* Criação de repositório remoto no Github
* Envio do repositório local para o repositório remoto

### Foi utilizado o seguinte passo a passo
**Elaboração e teste do prompt pelo desenvolvedor, no caso eu. O prompt inicial foi o seguinte:**
```
Crie um script shell que faça o seguinte passo a passo de forma rigorosa:
1 Criar uma pasta com o nome projeto_x
2 Entrar na pasta projeto_x
3 Verificar se o virtualenv está instalado e instalar caso não esteja.
4 Criar um ambiente virtual com o comando:      python -m venv .venv
5 Ativar o ambiente virtual com o comando:  source .venv/bin/activate
6 Instalar as bibliotecas passadas por parâmetro: flask requests etc
7 Criar um arquivo com os requerimentos chamado requirements.txt e adicionar os pacotes instalados com pip freeze > requirements.txt
8 Criar um arquivo chamado app.py e dentro dele crie o código usando flask e requests para fazer requisição a API com a url http://localhost/produtos
9 Criar um arquivo tests.py e adicionar um código para testar a aplicação e garantir o funcionamento adequado.
10 Executar o arquivo tests.py e verificar se o resultado é o esperado e correto.
11 Criar um repositório do git com: git init
12 Adicionar as alterações com: git add .
13 Criar um commit com mensagem adequada como: git commit -m “Criada a aplicação e caso de teste”.
14 Criar um arquivo chamado README.md e documentar a aplicação, adicionar o passo a passo para executar corretamente.
15 Copiar o arquivo .gitignore que está na pasta anterior e colar na pasta do projeto.
16 Adicionar os arquivo README.md e .gitignore ao repositório com git add . e criar um commit com uma mensagem adequada
17 Criar um repositório remoto no Github com o nome do projeto
18 Fazer o push para enviar o projeto para o repositório remoto
19 Executar a aplicação criada com: python app.py
20 Executar a url com o curl e verificar se a resposta é válida.
```
**O resultado do código foi surpreendente, mas não perfeito. Então fiz alguns poucos ajustes e o resultado está no arquivo criar_app_completa.sh**<br>
É incrível o poder que essas ferramentas colocaram em nossas mãos. Vamos usar com responsabilidade e aumentar a produtividade!

### Passo a passo para executar:
1. Clonar o repositório Git. `pip install -r requirements.txt`.
6. Instale as dependências do projeto executando `pip install -r requirements.txt`.
7. Ative o ambiente virtual com o comando `source .venv/bin/activate`.
8. Execute o arquivo app.py com o comando `python app.py`.
Sinta-se à vontade para contribuir com este projeto!
