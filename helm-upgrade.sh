#!/bin/bash
helm install --version '2.5.3' --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole
