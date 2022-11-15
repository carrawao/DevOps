FROM python:3

WORKDIR /devops
COPY . /devops

COPY /devops/requirements.txt /devops/requirements.txt

RUN apt-get -y update
RUN pip3 install -r /devops/requirements.txt

ENV PORT 5000
EXPOSE 5000

ENV FLASK_APP="devops/app.py"
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]