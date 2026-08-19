# Flask + MySQL Grocery Store

A beginner/intermediate project for practicing Flask, MySQL/SQL, and later Docker.

## Features
- Product listing
- Add product
- Delete product
- Customer listing
- Order listing
- MySQL relational database
- SQL initialization script
- Sample data

## Run without Docker

### 1. Create database
Install MySQL and run:

    mysql -u root -p < database/init.sql

### 2. Install Python packages

    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt

### 3. Set database variables

You can export them:

    export DB_HOST=mysql
    export DB_USER=root
    export DB_PASSWORD=adeel
    export DB_NAME=grocery_db

### 4. Start Flask

    python3 app.py

Open:

    http://localhost:5000

## Docker practice

This project intentionally does NOT include Dockerfile or compose.yaml.

Your task is to create:
1. Dockerfile for Flask
2. Dockerfile is not required for MySQL; use mysql image
3. compose.yaml connecting Flask and MySQL
4. MySQL volume
5. Environment variables
6. Healthcheck/dependency
7. Exposed Flask port

Database tables are in `database/init.sql`.
