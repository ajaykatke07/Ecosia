FROM ubuntu:18.04
WORKDIR /project
RUN apt-get update && apt-get install -y python3 python3-pip
COPY webserver.py /project
EXPOSE 2022
RUN pip3 install klein
CMD ["python3", "webserver.py"]