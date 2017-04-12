#!/bin/bash

docker build -t="steelhousedev/ubuntu-java-gradle" base
docker build -t="steelhousedev/storm:1.0.1" storm
docker build -t="steelhousedev/storm-nimbus:1.0.1" storm-nimbus
docker build -t="steelhousedev/storm-supervisor:1.0.1" storm-supervisor
docker build -t="steelhousedev/storm-ui:1.0.1" storm-ui