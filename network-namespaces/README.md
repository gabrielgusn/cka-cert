## You will need sudo to run these commands on your computer

> If you want to delete the resources created by the scripts, just run

```sh
    sudo ip netns delete <network-namespace>

    #CAUTION!!! This will delete all your network namespaces, I recommend checking which namespaces you have on your device before deleting, using `ip netns`
    #if you don't want to specify the name of the ns you can just run the following
    sudo ip -all netns delete 

    #to delete the links and interfaces you can the following: (`ip a` or `ip link` to check existing ones)
    sudo ip link delete <link-name> #in our case v-net-0, veth-red, veth-blue, etc.
```