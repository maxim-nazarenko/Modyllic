FROM centos:7

RUN yum install -y \
  which \
  make \
  php-pear \
  php-mbstring \
  git && \
  yum clean all -y

COPY . ./app/

WORKDIR /app

RUN make install-build-prereqs install-dist-prereqs install && make clean

ENV PATH="/app/scripts:${PATH}"

ENTRYPOINT ["modyllic"]
