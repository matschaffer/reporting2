#!/usr/bin/env bash

set -e

if rpm -q grafana; then
  echo "Grafana already installed."
  exit 0
fi

wget https://dl.grafana.com/oss/master/grafana-7.2.0-3f6b253fpre.linux-amd64.tar.gz
tar -zxvf grafana-7.2.0-3f6b253fpre.linux-amd64.tar.gz

/usr/sbin/grafana-cli plugins install petrslavotinek-carpetplot-panel
/usr/sbin/grafana-cli plugins install grafana-worldmap-panel
/usr/sbin/grafana-cli plugins install grafana-googlesheets-datasource
/usr/sbin/grafana-cli plugins install simpod-json-datasource

/usr/sbin/grafana-cli --pluginUrl https://github.com/panodata/grafana-map-panel/releases/download/0.9.0/grafana-map-panel-0.9.0.zip plugins install grafana-worldmap-panel-ng

/sbin/chkconfig --add grafana-server
/sbin/service grafana-server start

ls -ll -a
