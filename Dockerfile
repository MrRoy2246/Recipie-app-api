# Use the official Python image based on Alpine
FROM python:3.10-alpine


# Use LABEL instead of deprecated MAINTAINER
LABEL maintainer="AbinRoy"

# Set environment variable using modern format
ENV PYTHONUNBUFFERED=1

# Copy the requirements file into the container
COPY ./requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install -r /requirements.txt

# Create the /app directory inside the container
RUN mkdir /app

# Set /app as the working directory
WORKDIR /app

# Copy the app source code into the container
COPY ./app /app

# Create a new user and switch to that user for security
RUN adduser -D user
USER user


