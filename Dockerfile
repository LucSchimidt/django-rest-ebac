# syntax=docker/dockerfile:1

FROM python:3.8.1-slim as python-base

# Configurações do ambiente
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# Diretório de trabalho
WORKDIR /app

# Instalação das dependências do Python
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copia os arquivos do aplicativo para o contêiner
COPY . /app/

# Expor a porta 8000
EXPOSE 8000

# Comando para executar o servidor Django
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]
