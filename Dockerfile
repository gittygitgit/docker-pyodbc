FROM centos:latest
ENV foo=bar
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install python-pip; yum clean all
RUN yum -y install gcc-c++; yum clean all
RUN yum -y install python-devel; yum clean all
RUN yum -y install unixODBC-devel; yum clean all
RUN yum -y install nc; yum clean all
RUN yum -y install sudo
RUN pip install pyodbc
RUN pip install --upgrade pip
RUN yum remove unixODBC-utf16 unixODBC-utf16-devel #to avoid conflicts
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo
RUN ACCEPT_EULA=Y yum -y install msodbcsql17
RUN ACCEPT_EULA=Y yum -y install mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc
ENV foo="foo"

COPY entrypoint.sh entrypoint.sh
COPY odbc.ini.template odbc.ini.template

RUN sudo odbcinst -i -s -f odbc.ini.template -l

RUN chmod +xwr entrypoint.sh
ENTRYPOINT ./entrypoint.sh
