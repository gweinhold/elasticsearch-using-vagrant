#!/bin/bash

sudo echo 'http_proxy=http://<proxy>:80' >> ~/.bashrc
sudo echo 'https_proxy=http://<proxy>:80' >> ~/.bashrc
export http_proxy
export https_proxy

# add EPEL repository to yum
sudo yum -q -y install epel-release

# refresh repolist
sudo yum repolist

# install nano
sudo yum -y install nano

# install screen
sudo yum -y install screen

# install htop
sudo yum -y install htop

# install wget for the next action
sudo yum -y install wget

# download Java
wget -nv --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

# install Java
yum -y localinstall jdk-8u131-linux-x64.rpm

# delete java install
rm jdk-8u131-linux-x64.rpm

# elasticsearch GPG key
sudo rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch

# download ElasticSearch 5.5
wget -nv --no-check-certificate https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.rpm

# install ElasticSearch 5.5
rpm --install elasticsearch-5.5.0.rpm

# cleanup ElasticSearch install
rm elasticsearch-5.5.0.rpm

# Reload systemd manager configuration & start ElasticSearch
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service

# allow host OS to access through port forwarding
echo 'network.bind_host: 0' | sudo tee --append /etc/elasticsearch/elasticsearch.yml
echo 'network.host: 0.0.0.0' | sudo tee --append /etc/elasticsearch/elasticsearch.yml

# download kibana
wget -nv --no-check-certificate https://artifacts.elastic.co/downloads/kibana/kibana-5.5.0-x86_64.rpm

# install kibana
sudo rpm --install kibana-5.5.0-x86_64.rpm

# cleanup kibana install
rm kibana-5.5.0-x86_64.rpm

echo 'server.host: "0.0.0.0"' | sudo tee --append /etc/kibana/kibana.yml

# Reload systemd manager configuration & start kibana
sudo systemctl daemon-reload
sudo systemctl enable kibana
sudo systemctl start kibana
