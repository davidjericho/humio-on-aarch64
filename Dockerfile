FROM humio/humio AS appsource

FROM alpine
COPY --from=appsource /run.sh /run.sh
COPY --from=appsource /etc/kafka /etc/kafka
COPY --from=appsource /app /app
COPY --from=appsource /products /products
COPY --from=appsource /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 8080
ENV DEFAULT_INTER_BROKER_PROTOCOL_VERSION=2.4
ENV JAVA_HOME=/usr/lib/jvm/zulu17-ca
ENV KAFKA_HEAP_OPTS=-Xss2M
ENV KAFKA_OPTS=-Xss2M -Djava.rmi.server.useCodebaseOnly=true -Dcom.sun.jndi.ldap.object.trustURLCodebase=false -Dcom.sun.jndi.cosnaming.object.trustURLCodebase=false
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV ZOOKEEPER_OPTS=-Xss2M -Djava.rmi.server.useCodebaseOnly=true -Dcom.sun.jndi.ldap.object.trustURLCodebase=false -Dcom.sun.jndi.cosnaming.object.trustURLCodebase=false
RUN wget --quiet https://cdn.azul.com/public_keys/alpine-signing@azul.com-5d5dc44c.rsa.pub -P /etc/apk/keys/ && \
    apk --repository https://repos.azul.com/zulu/alpine --no-cache add zulu17-jre~=17.0.3 tzdata  && \
    apk add --no-cache bash supervisor util-linux
VOLUME [ "/data", "/backup" ]
WORKDIR /data
CMD /bin/bash -c /run.sh
