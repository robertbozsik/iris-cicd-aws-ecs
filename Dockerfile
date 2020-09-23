# Install Python on a small linux called Alpine
# FROM python:3.8-alpine
# docker build --tag<IMAGE name> . finished with status 'error'
# downgrade to python 3.6
FROM python:3.6-slim

# Installing dependencies
COPY ./requirements.txt ./requirements.txt
RUN pip install -r /requirements.txt

# Copying the source code to
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Creating and logging a user
# RUN adduser -D user
# USER user

# Commands for Docker run
EXPOSE 8000
CMD ["python", "app.py"]