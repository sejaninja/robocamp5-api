FROM python:3.7.7-stretch

WORKDIR /tmp

COPY requirements.txt ./

RUN pip install -r requirements.txt

CMD ["python"]