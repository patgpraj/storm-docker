#!/bin/bash

#docker build -t="registry.steelhouse.com/ubuntu-java-gradle" base
docker build -t="registry.steelhouse.com/storm:1.0.1" storm
docker build -t="registry.steelhouse.com/storm-nimbus:1.0.1" storm-nimbus
docker build -t="registry.steelhouse.com/storm-supervisor:1.0.1" storm-supervisor
docker build -t="registry.steelhouse.com/storm-ui:1.0.1" storm-ui