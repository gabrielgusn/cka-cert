#!/bin/bash
echo "Creating network namespaces"
ip netns add red
ip netns add blue
ip netns add yellow
ip netns add green

echo "Creating Linux Bridge"
ip link add v-net-0 type bridge
ip link set dev v-net-0 up

echo "Creating virtual cables"
ip link add veth-red type veth peer name veth-red-br
ip link add veth-blue type veth peer name veth-blue-br
ip link add veth-yellow type veth peer name veth-yellow-br
ip link add veth-green type veth peer name veth-green-br

echo "Attaching virtual cables to networks"
ip link set veth-red netns red
ip link set veth-red-br master v-net-0
ip link set veth-blue netns blue
ip link set veth-blue-br master v-net-0
ip link set veth-yellow netns yellow
ip link set veth-yellow-br master v-net-0
ip link set veth-green netns green
ip link set veth-green-br master v-net-0

echo "Assigning IPs to the networks"
ip -n red addr add 192.168.15.1 dev veth-red
ip -n red link set veth-red up
ip -n blue addr add 192.168.15.2 dev veth-blue
ip -n blue link set veth-blue up
ip -n green addr add 192.168.15.3 dev veth-green
ip -n green link set veth-green up
ip -n yellow addr add 192.168.15.4 dev veth-yellow
ip -n yellow link set veth-yellow up
