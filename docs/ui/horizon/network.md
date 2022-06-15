# Working with Networks in Horizon

## Create a Network

![](/img/horizon_create_network.webp){ align=right ; width=50% }

1. Click on `Project` → `Network` → `Network Topology` → `+Create Network`

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_network_name.webp){ align=right ; width=50% }

2. Enter a network name, for example, `<username>_net`.

* After giving it a descriptive name, press the blue `NEXT` button.

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_subnet.webp){ align=right ; width=50% }

3. Enter a subnet name, e.g. `<username>`_subnet, and a network address, e.g. `10.1.1.0/24`, and a gateway address, e.g. `10.1.1.1`.

* This should be a non-routable subnet. You can use `10.0.0.0 - 10.255.255.255`, `172.16.0.0 - 172.31.255.255`, `192.168.0.0 - 192.168.255.255`.

* If you're not sure what to choose, you can go with `10.1.1.0/24` → this will give you 255 available addresses in the `10.1.1.0` domain.

* If you choose `10.1.1.0/24` you can then set the gateway address to be `10.1.1.1`

* After giving it a descriptive name, press the blue `NEXT` button.

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_network_dhcp.webp){ align=right ; width=50% }

4. Click `Create` to create the new network.

    !!! note ""

        Do NOT uncheck the `Enable DHCP` box unless you are familiar with setting the advanced features of OpenStack networks, subnets, and routers.

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_create_router.jpg){ align=right ; width=50% }

5. Click on `+Create Router`.

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_router_name.jpg){ align=right ; width=50% }

6. Enter a router name, for example, `<username>_router`.

* Under the `External Network` dropdown, select `public`, then click `Create Router`

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_router_name.jpg){ align=right ; width=50% }

6. Enter a router name, for example, `<username>_router`.

* Under the `External Network` dropdown, select `public`, then click `Create Router`
* After giving it a descriptive name, press the blue `NEXT` button.

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_net_top_graph.webp){ align=right ; width=50% }

7. You'll need to connect your private network to the router. Make sure  you're in Graph mode (vs Topology mode). Your screen should look like the top image on the right. If it looks like bars it's in Topology mode, click the `Graph` tab under the `Network Topology` page heading to put it into Topology mode

* Click on the router you just created then `+Add Interface`.

![](/img/horizon_net_interface.jpg){ align=right ; width=50% }

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_router-add.png){ align=right ; width=50% }

8. Select the subnet you just created from the dropdown list.

* Click `Submit`

</br></br></br></br></br></br></br></br>

---

![](/img/horizon_network_final.webp){ align=right ; width=30% }

9. The network should now be connected to the new router.  The end result will look similar to the diagram.

</br></br></br></br></br></br></br></br>

---
