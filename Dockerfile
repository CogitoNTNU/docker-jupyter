FROM python:3.7-alpine3.8
WORKDIR /code
RUN mkdir tmp notebook
ADD setup_files/requirements.txt tmp
RUN apk add gcc g++ python3-dev
RUN pip3 install -r tmp/requirements.txt
RUN jupyter notebook --generate-config
ADD setup_files tmp
ADD code .
CMD ["sh", "init.sh"]
