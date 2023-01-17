FROM python:3.10-alpine

ENV DASH_DEBUG_MODE False
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt --no-cache

COPY . /app
WORKDIR /app

EXPOSE 8283
CMD ["waitress-serve", "--port=8283", "app:app.server"]