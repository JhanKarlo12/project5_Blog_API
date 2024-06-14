FROM python:3.10.4-slim-bullseye

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Establece el directorio de trabajo
WORKDIR /code
# Instala archivo de requisitos
COPY ./requirements.txt .
RUN pip install -r requirements.txt
# Copia el contenido del proyecto dentro del contenedor
COPY . .
#Ejecuta migraciones y luego el servidor
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]