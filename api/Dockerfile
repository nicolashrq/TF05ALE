FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install flask requests mysql-connector-python pyyaml

CMD ["python", "app.py"]