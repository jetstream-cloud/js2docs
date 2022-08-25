# Working with Networks in Horizon

## Create a Network

![](/images/horizon_create_network.webp){ align=right ; width=50% }

1. **Network**

* You will need a network that Virtual Machines can use.

* If `auto_allocated_network` exists from Exosphere, you may wish to use that one and can skip ahead.</br>-**Otherwise**-</br>

* In the left menus, click on `Project` → `Network` → `Network Topology` → `+Create Network`

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_network_name.webp){ align=right ; width=50% }

2. **Network name**

* Enter a network name, for example, `<username>_net`.

* After giving it a descriptive name, press the blue `NEXT` button.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_subnet.webp){ align=right ; width=50% }

3. **Subnet**

* Enter a subnet name, e.g. `<username>_subnet`, and </br>a network address, e.g. `10.1.1.0/24`, and </br>a gateway address, e.g. `10.1.1.1`.

    * This should be a non-routable subnet.
    * You can use `10.0.0.0 - 10.255.255.255`, `172.16.0.0 - 172.31.255.255`, `192.168.0.0 - 192.168.255.255`.

* If you're not sure what to choose, you can go with `10.1.1.0/24` → this will give you 255 available addresses in the `10.1.1.0` domain.

* If you choose `10.1.1.0/24` you can then set the gateway address to be `10.1.1.1`

* After giving it a descriptive name, press the blue `NEXT` button.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_network_dhcp.webp){ align=right ; width=50% }

4. **Create**

* Click `Create` to create the new network.

    !!! warning ""

        Do NOT uncheck the `Enable DHCP` box unless you are familiar with setting the advanced features of OpenStack networks, subnets, and routers.

</br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/horizon_create_router.jpg){ align=right ; width=50% }

5. **Router**

* [Jetstream2 Policy](/general/policies) defaults to `router quota = 1`.</br>If you already have the `auto_allocated_network` and have not requested a quota increase, the button `+Create Router` may be greyed out.</br>-**Otherwise**-</br>

* Click on `+Create Router`.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_router_name.jpg){ align=right ; width=50% }

6. **Router name**

* Enter a router name, for example, `<username>_router`.
* Under the `External Network` dropdown, select `public`, then click `Create Router`
* After giving it a descriptive name, press the blue `NEXT` button.

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_net_top_graph.webp){ align=right ; width=50% }

7. **Connect Network to Router**

* You'll need to connect your private network to the router.</br>Make sure  you're in `Graph` mode (vs `Topology` mode). Your screen should look like the top image on the right.
    * If it looks like it's in `Topology` mode, click the `Graph` tab under the `Network Topology` page heading to put it into `Graph` mode

* Click on the router you just created (*or **auto_allocated_router** *),</br>then `+Add Interface`.

![](/images/horizon_net_interface.jpg){ align=right ; width=50% }

</br></br></br></br></br></br></br></br></br></br></br></br>

!!! warning "auto_allocated_network"

    If ***auto_allocated_network*** is present, you can simply use ***auto_allocated_network*** without all these steps. You only need to connect to the ***auto_allocated_router*** if you need a separate CIDR block for your VMs.

</br></br>

---

![](/images/horizon_router-add.png){ align=right ; width=50% }

8. **Select subnet**

* Select the subnet you previously created from the dropdown list.

* Click `Submit`

</br></br></br></br></br></br></br></br>

---

![](/images/horizon_network_final.webp){ align=right ; width=30% }

9. The network should now be connected to the new router.  The end result will look similar to the diagram.

</br></br></br></br></br></br></br></br></br></br></br>

---
