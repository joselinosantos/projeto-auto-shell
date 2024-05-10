#!/bin/bash

# 1. Criar uma pasta com o nome projeto
projeto_nome="projeto-auto-shell"
mkdir $projeto_nome

# 2. Entrar na pasta projeto
cd $projeto_nome

# 3. Verificar se o virtualenv está instalado e instalar caso não esteja
if ! command -v virtualenv &> /dev/null; then
    echo "Instalando virtualenv..."
    pip install virtualenv
fi

# 4. Criar um ambiente virtual
python3 -m venv .venv

# 5. Ativar o ambiente virtual
source .venv/bin/activate

# 6. Instalar as bibliotecas passadas por parâmetro (ex: flask)
if [ $# -eq 0 ]; then
    echo "Nenhuma biblioteca passada como parâmetro. Exemplo de uso: ./script.sh flask"
    exit 1
fi

for package in "$@"; do
    pip install "$package"
done

# 7. Criar um arquivo requirements.txt
pip freeze > requirements.txt

# 8. Criar um arquivo chamado app.py e adicionar o código para fazer requisição à API
endpoint="produtos"
cat <<EOF > app.py
from flask import Flask, request
import requests

app = Flask(__name__)

@app.route('/produtos')
def index():
    response = requests.get('https://fakestoreapi.com/products')
    return response.text

if __name__ == '__main__':
    app.run(debug=True)
EOF

# 9. Criar um arquivo com caso de teste para o código
echo "
import unittest
from app import app

class TestApp(unittest.TestCase):
    def test_index(self):
        response = app.test_client().get('/$endpoint')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {'message': 'Requisição recebida com sucesso!'})

if __name__ == '__main__':
    unittest.main()
" > teste_app.py

# 10. Criar um repositório do git
git init

git config --global --add safe.directory /media/jota/SSD/DEV/AUTOMACAO/ShellScript/$projeto_nome

# 11. Adicionar as alterações
git add .

# 12. Criar um commit com mensagem adequada
git commit -m "Criada a aplicação e caso de teste"

# 13. Criar um arquivo README.md e documentar a aplicação
echo "## Projeto $projeto_nome" > README.md
echo "Este projeto demonstra a criação de uma aplicação Flask básica com automação via script shell." > README.md
echo "Passo a passo para executar:" >> README.md
echo "1. Clonar o repositório Git. \`pip install -r requirements.txt\`." >> README.md
echo "2. Entrar na pasta do projeto: \`cd $projeto_nome`.
echo "3. Ativar o ambiente virtual: \`source .venv/bin/activate`.
echo "4. Executar a aplicação: \`python3 app.py`.
echo "5. Testar a aplicação: \`python3 teste_app.py`.
echo "6. Instale as dependências do projeto executando \`pip install -r requirements.txt\`." >> README.md
echo "7. Ative o ambiente virtual com o comando \`source .venv/bin/activate\`." >> README.md
echo "8. Execute o arquivo app.py com o comando \`python app.py\`." >> README.md
echo "Sinta-se à vontade para contribuir com este projeto!" >> README.md

# 14. Adicionar o arquivo README.md ao repositório e criar um commit
git add README.md
git commit -m "Adicionado arquivo README.md"

# 15. Executar a aplicação com curl e verificar se a resposta é válida
curl -X http://localhost/$endpoint

# 16. Enviar para repositório remoto - push
# Credenciais do GitHub - substitua pelos seus dados
usuario_github="joselinosantos"
token_github="seu-token-aqui"

description="Projeto Criando uma aplicação de forma automatizada com IA e Shellscript"

# 17. Cria o repositório remoto no GitHub
curl -u "$usuario_github:$token_github" https://api.github.com/user/repos -d "{\"name\":\"$projeto_nome\", \"description\":\"$description\"}"

# 18. Adiciona o repositório remoto do GitHub como origin
git remote add origin "https://github.com/$usuario_github/$projeto_nome.git"

# 19. Faz o push para enviar o projeto para o repositório remoto
git push -u origin master

echo "Projeto enviado para o repositório remoto no GitHub com sucesso!"

# 20. Remover credencial de outra conta
git config --global --unset credential.helper

# 21.Salvar credencial
git config --global credential.helper cache
