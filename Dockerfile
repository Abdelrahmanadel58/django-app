FROM python:3.6

WORKDIR /application
COPY . .
RUN apt update 
RUN apt upgrade -y

RUN pip3 install -r requirements.txt
RUN python3 manage.py migrate
COPY request.py /usr/local/lib/python3.6/site-packages/django/http/request.py
EXPOSE 8000
CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
