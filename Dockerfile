FROM python:3.7-alpine3.8
WORKDIR /code
RUN mkdir /code/tmp
RUN mkdir /code/notebook
ADD setup_files/requirements.txt /code/tmp
RUN apk add gcc g++ python3-dev
RUN pip3 install -r tmp/requirements.txt
RUN jupyter notebook --generate-config
ADD setup_files tmp
ADD init.sh /code
CMD ["sh", "init.sh"]
