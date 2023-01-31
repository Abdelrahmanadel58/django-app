FROM python:3.6

WORKDIR /application
COPY . .
#RUN apt update 
RUN pip3 install -r requirements.txt
RUN python3 manage.py migrate

EXPOSE 8000
CMD ["python3","manage.py","runserver","0.0.0.0:8000"]
