#Horizon

Horizon is a web-based GUI for interacting with the Openstack API. It is likely the most complete GUI for working with Openstack but isn't the fastest or most user-friendly. Almost all functionality that is available from the CLI is available in Horizon. [Exosphere](../exo/exo.md) and [Cacao](../cacao/intro.md) both provide subsets of Horizon functionality with more focus on ease of use.

That said, there are times you may need the more complete features of Horizon instead of the other GUI interfaces. This documentation will cover the basics of launching, using, and managing instances, using various storage options in Horizon, using container orchestration engines, and other aspects of using Openstack.

### Logging into horizon

---

![](/images/JS2-Horizon-Login-Screen.png){ align=right ; width=50% }

1. **Navigate**

* Navigate to [https://js2.jetstream-cloud.org](https://js2.jetstream-cloud.org)</br>
Make sure it says "XSEDE Globus Auth" in the Authenticate Using box.

</br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-Globus-Screen.png){ align=right ; width=50% }

2. **Globus Authentication**

* The first time you log in you'll be directed to a Globus page to permit authorization.</br></br>
If you have linked institutional, Google, Orcid, or other credentials, you'll be able to use those to authenticate.<p> We know XSEDE credentials work correctly so we will show that in our example.

</br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-XSEDE-Auth-Screen.png){ align=right ; width=50% }

3. **XSEDE credentials**

* The next page should be the login screen for your credentials. We're showing the XSEDE login screen as our example.

</br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-XSEDE-Duo-Screen.png){ align=right ; width=50% }

4. **Multi Factor Authentication**

* If you're using multi-factor authentication with your credentials as XSEDE does, you'll likely get a Duo or an Authenticator screen here.

</br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-Horizon-Home.png){ align=right ; width=50% }

5. **Horizon Dashboard**

* You should be at the Horizon Dashboard home now.

</br></br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-Horizon-Change-Projects.png){ align=right ; width=50% }

6. **Project**

* If you are on multiple XSEDE allocations, you'll want to verify you're using the correct one and change to the correct one if you are not. </br></br>You do that by clicking at the top left next to the Jetstream2 logo where it has `XSEDE * AAA000000 * IU`. That will show allocations under "Projects".

</br></br></br></br></br></br></br></br></br></br>

---



### Getting started with Horizon

* [Creating and managing security groups](security_group.md)
* [Creating networks](network.md)
* [Launching an instance](launch.md)
* [Managing instances](manage.md)
* [Using volumes](storage.md)
* [Using Manila shares](manila.md)
* [Troubleshooting in Horizon](troubleshooting.md)
