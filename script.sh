#!/bin/bash
VER=0.18.1
curl -s -LO https://github.com/prometheus/node_exporter/releases/download/v${VER}/node_exporter-${VER}.linux-amd64.tar.gz
tar -xvf node_exporter-${VER}.linux-amd64.tar.gz
sudo mv node_exporter-${VER}.linux-amd64/node_exporter /usr/local/bin/
sudo useradd -rs /bin/false node_exporter

sudo cp node_exporter.service /etc/systemd/system/node_exporter.service

sudo systemctl daemon-reload 
sudo systemctl enable node_exporter.service
sudo systemctl start node_exporter.service

echo "service has been added and activated"

sudo systemctl status node_exporter.service
