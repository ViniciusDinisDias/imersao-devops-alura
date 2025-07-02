FROM python:3.11-slim-buster


# Define o diretório dee traballho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependências
# Usamos --no-cache-dir para evitar o  cachee do pip, rreduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


# Copia o restante do código da aplicação para o diretório do contêiner
COPY . .

# Comando para rodar a aplicação  usando unicorn
# O host  0.0.0.0  permite que a aplicação seja acessível externamente ao container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# Expõe a porta que a aplicação FastAPI ira rodar (padrão é 8000)
EXPOSE 8000
