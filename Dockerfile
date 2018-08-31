FROM nvidia/cuda
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /code
RUN mkdir tmp notebook
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install python3 python3-pip
ADD setup_files tmp
RUN cd tmp && \
	tar -zxvf *cudnn*.tgz* && \
	cp cuda/lib64/* /usr/local/cuda-9.0/lib64/ && \
	cp cuda/include/* /usr/local/cuda-9.0/include/ && \
	chmod a+r /usr/local/cuda-9.0/include/cudnn.h
ENV PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
RUN pip3 install -U pip
RUN pip3 install --no-cache-dir -r tmp/requirements.txt
RUN jupyter notebook --generate-config
ADD code .
CMD ["sh", "run.sh"]
