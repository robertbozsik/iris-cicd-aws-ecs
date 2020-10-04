# Install Python on a lightweight Linux distribution called Alpine
# FROM python:3.8-alpine
# docker build --tag<IMAGE name> . finished with status 'error'
# downgrade to 3.6-slim
FROM python:3.6-slim

# Installing dependencies
COPY ./requirements.txt ./requirements.txt
RUN pip install -r /requirements.txt

# Copying the source code to
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# We strongly recommend testing images locally as a non-root user, as containers 
# are not run with root privileges in AWS/Heroku. 
# Immediately before CMD you can add the following commands to your Dockerfile:
# If using Alpine:
# RUN adduser -D user
# USER user

# Commands for Docker run
EXPOSE 8000
CMD ["python", "app.py"]