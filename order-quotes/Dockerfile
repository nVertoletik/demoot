FROM python:3.10-slim

WORKDIR /app

COPY order-quotes/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 8090

CMD ["python", "order-quotes/main.py"]