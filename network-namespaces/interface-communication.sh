#!/bin/bash

echo "Creating network namespace: red"
ip netns add red

echo "Creating network namespace: blue"
ip netns add blue

echo "Creating virtual cable between networks"
ip link add veth-red type veth peer name veth-blue

echo "Connecting networks"  
ip link set veth-red netns red
ip link set veth-blue netns blue

echo "Assigning IPs to the networks' interfaces"
ip -n red addr add 192.168.15.1/24 dev veth-red
ip -n blue addr add 192.168.15.2/24 dev veth-blue

echo "Setting links Up"
ip -n red link set veth-red up
ip -n blue link set veth-blue up

echo "You can now check the network namespaces by executing the command 'ip netns':"
echo `ip netns`
echo "To test connectivity between the networks you can just use 'ip netns exec red ping 192.168.15.2' or 'ip netns exec blue ping 192.168.15.1'"
echo -e "\nFor now, testing connectivity from \n\t\tred -> blue\n"
ip netns exec red ping 192.168.15.2 -c 4
echo -e "\nAnd now the contrary \n\t\tblue -> red\n"
ip netns exec blue ping 192.168.15.1 -c 4