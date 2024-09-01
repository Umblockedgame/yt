# Usa una imagen base de Python
FROM python:3.10-slim

# Configurar el entorno virtual y las dependencias
WORKDIR /app

# Copia los archivos de requerimientos
COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY . .

# Exponer el puerto que usará tu aplicación
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["waitress-serve", "--port", "8080", "main:app"]
