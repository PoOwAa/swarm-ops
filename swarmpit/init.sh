#/bin/bash

# Get the Swarm node ID of this (manager) node and store it in an environment variable:
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

# Create a label in this node, so that the CouchDB database used by Swarmpit is always deployed to the same node and uses the existing volume:
docker node update --label-add swarmpit.db-data=true $NODE_ID

# Create another label in this node, so that the Influx database used by Swarmpit is always deployed to the same node and uses the existing volume:
docker node update --label-add swarmpit.influx-data=true $NODE_ID