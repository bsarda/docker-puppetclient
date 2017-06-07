# written by Benoit Sarda
# base of puppet client, for easy tests
#   bsarda <b.sarda@free.fr>
#
FROM centos:centos7.2.1511
LABEL maintainer "b.sarda@free.fr"

# install packages
RUN rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-$(uname -r | sed 's/.*el\([0-9]\).*/\1/g').noarch.rpm && \
	yum install -y net-tools puppet-agent iproute && \
	rm -rf /etc/puppetlabs/puppet/ssl/* && \
	sed -i.bkp 's@export PATH@PATH=$PATH:/opt/puppetlabs/bin/\nexport PATH@g' /root/.bash_profile && \
	sed -i.bkp 's@export PATH@PATH=$PATH:/opt/puppetlabs/bin/\nexport PATH@g' /etc/profile && \
	yum clean all

# start
CMD ["/bin/bash"]
