FROM python:3.8

# Dependências do sistema
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Dependências do Python
WORKDIR /home/user

COPY requirements.txt ./requirements.txt

RUN python -m pip install --upgrade pip && \
    python -m pip install -r requirements.txt

# Notebook
COPY PFG.ipynb ./PFG.ipynb

EXPOSE 4000

ENTRYPOINT ["jupyter", "notebook", "--ip", "0.0.0.0", "--port", "4000", "--allow-root"]

