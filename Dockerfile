FROM centos:6
MAINTAINER Igor Kupczynski https://kupczynski.info

COPY pkg/ /app/pkg
COPY bin/ /app/bin

RUN yum -y install initscripts && \
    rpm -i /app/pkg/foundationdb-clients-5.1.5-1.el6.x86_64.rpm && \
    rpm -i /app/pkg/foundationdb-server-5.1.5-1.el6.x86_64.rpm && \
    yum clean all

EXPOSE 4500

CMD /app/bin/run-fdb.sh
