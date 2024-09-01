FROM python:3.10



# Configurar el entorno virtual y las dependencias
WORKDIR /app
COPY requirements.txt .
RUN python -m venv /opt/venv && . /opt/venv/bin/activate \
    && pip install -r requirements.txt

# Copiar el código de la aplicación
COPY . .

# Exponer el puerto que usará tu aplicación
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["/opt/venv/bin/waitress-serve", "--port", "8080", "main:app"]
