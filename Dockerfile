FROM ubuntu:bionic
WORKDIR /code
RUN mkdir tmp notebook
RUN apt-get update
RUN apt-get -y install python3 python3-pip
ADD setup_files tmp
RUN pip3 install -U pip
RUN pip3 install --no-cache-dir -r tmp/requirements.txt
RUN jupyter notebook --generate-config
ADD code .
CMD ["sh", "init.sh"]
