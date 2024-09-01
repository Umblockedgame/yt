# Usa una imagen base de Python
FROM python:3.12-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de requerimientos y la aplicación al contenedor
COPY requirements.txt requirements.txt
COPY . .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto en el que Flask corre por defecto
EXPOSE 8080

# Comando para ejecutar la aplicación con Waitress
CMD ["waitress-serve", "--port=8080", "main:app"]
