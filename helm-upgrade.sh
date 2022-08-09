#!/bin/bash
helm install --version '2.9.0' --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole
