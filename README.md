# Elastic Search using Vagrant
An easy to install vagrant setup using Elasticsearch & Kibana 5.5.

## Installation
* First, make sure you have VirtualBox installed. You can grab the latest version here: [Downloads - Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Make sure you have vagrant installed. You can grab the latest version here: [Download - Vagrant by HashiCorp](https://www.vagrantup.com/downloads.html)

### CentOS VM

```
$ git clone https://github.com/Educents/elasticsearch-using-vagrant ./vm-elastic
$ cd vm-elastic && vagrant up centos
```

## Usage
After installing the ElasticSearch server, you'll be able to head over to [http://localhost:9200/](http://localhost:9200/) to check the current ElasticSearch information.

* Kibana ([http://localhost:5603/](http://localhost:5603/)) has been installed.

## Plugins
* Plugins since ElasticSearch 5.0 are deprecated.  Kibana [plugins](https://www.elastic.co/guide/en/kibana/current/known-plugins.html) are available instead.
