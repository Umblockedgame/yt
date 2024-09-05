FROM python:3.10

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar y instalar las dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY . .

# Exponer el puerto que usará tu aplicación
EXPOSE 8080

# Comando para iniciar la aplicación con Waitress
CMD ["waitress-serve", "--port=8080", "main:app"]
