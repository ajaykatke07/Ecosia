#/bin/bash
#Build dockerfile
docker build -t ecosia:1.0 .
#docker creating a runner
docker run -itd -p 8880:8880 --name ecosia ecosia:1.0
#docker push to register
docker push ecosia:1.0
#