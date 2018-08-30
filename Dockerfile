FROM ubuntu:bionic
WORKDIR /code
RUN mkdir tmp notebook
RUN apt-get update
RUN apt-get -y install python3 python3-pip software-properties-common
ADD setup_files tmp
RUN cd tmp && \
	dpkg -i cuda*9-0*deb && \
	apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub && \
	add-apt-repository ppa:graphics-drivers && \
	apt-get update && \
	apt-get install -y -f cuda && \
	tar -zxvf cudnn*.tgz* && \
	cp cuda/lib64/* /usr/local/cuda-9.0/lib64/ && \
	cp cuda/include/* /usr/local/cuda-9.0/include/ && \
	chmod a+r /usr/local/cuda-9.0/include/cudnn.h  && \
	cd ..
ENV PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
RUN pip3 install -U pip
RUN pip3 install --no-cache-dir -r tmp/requirements.txt
RUN jupyter notebook --generate-config
ADD code .
CMD ["sh", "run.sh"]
