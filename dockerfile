FROM python:3.6.1-alpine

EXPOSE 5000

ENV PYTHONDONTWRITEBYTECODE=1

COPY devops/requirements.txt .
RUN python -m pip install -r requirements


WORKDIR /devops
COPY . /devops


RUN python3 -m flask run --host=0.0.0.0

