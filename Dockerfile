FROM python:3.9-slim

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y ffmpeg

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY . .

# Instalar dependencias de Python
RUN pip install -r requirements.txt

# Comando para ejecutar la aplicación
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
