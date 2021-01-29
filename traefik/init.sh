#/bin/bash

# Create the docker network for traefik
docker network create --driver=overlay traefik-public

# Get the Swarm node ID of this node and store it in an environment variable:
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')

# Create a tag in this node, so that Traefik is always deployed to the same node and uses the same volume:
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID