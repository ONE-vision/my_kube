#!/bin/bash
#set -e

export NODE_1="k3s1"
export NODE_2="k3s2"
export NODE_3="k3s3"
export USER=root

# The first server starts the cluster
k3sup install \
  --cluster \
  --user $USER \
  --host $NODE_1 \
  --k3s-extra-args '--disable servicelb --disable traefik '

# The second node joins
k3sup join \
  --server \
  --host $NODE_2 \
  --user $USER \
  --server-user $USER \
  --server-host $NODE_1

# The third node joins
k3sup join \
  --server \
  --host $NODE_3 \
  --user $USER \
  --server-user $USER \
  --server-host $NODE_1