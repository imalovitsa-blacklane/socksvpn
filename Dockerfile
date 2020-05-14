From debian:bullseye
RUN apt-get update && apt-get install -y openvpn dante-server squid
COPY fs /
CMD /bin/bash /init.sh
