FROM python:3.11-alpine AS base
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM base AS dev
COPY . .
EXPOSE 3000
CMD ["flask", "--app", "app", "run", "--host=0.0.0.0", "--port=3000", "--reload"]

FROM base AS prod
COPY app.py .
RUN adduser -D appuser
USER appuser
EXPOSE 3000
CMD ["gunicorn", "--bind", "0.0.0.0:3000", "app:app"]