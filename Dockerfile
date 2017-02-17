FROM ubuntu
RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.
EXPOSE 8888
EXPOSE 55555
ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
btsync --dump-sample-config > btsync.conf
"listening_port" : 55555
"storage_path" : "/btsync/.sync"
"listen" : "0.0.0.0:8888"
docker build -t="btsync" .
docker run -d -p 8888:8888 -p 55555:55555 -v /srv/btsync/:/btsync/ btsync
