#Horizon

Horizon is a web-based GUI for interacting with the Openstack API. It is likely the most complete GUI for working with Openstack but isn't the fastest or most user-friendly. Almost all functionality that is available from the CLI is available in Horizon. [Exosphere](../exo/exo.md) and [Cacao](../cacao/intro.md) both provide subsets of Horizon functionality with more focus on ease of use.

That said, there are times you may need the more complete features of Horizon instead of the other GUI interfaces. This documentation will cover the basics of launching, using, and managing instances, using various storage options in Horizon, using container orchestration engines, and other aspects of using Openstack.

### Logging into horizon

---

![](/images/JS2-Horizon-Login-Screen.png){ align=right ; width=50% }

1. **Navigate**

* Navigate to [https://js2.jetstream-cloud.org](https://js2.jetstream-cloud.org)</br>
Make sure it says "ACCESS CiLogon" in the Authenticate Using box.

</br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-CiLogon-Screen.png){ align=right ; width=50% }

2. **CiLogon Authentication**

* You will be directed to a CILogon page to permit authorization the first time and any time your are using a new browser or your credentials go stale.</br></br>
If you have linked institutional, Google, Orcid, or other credentials, you'll be able to use those to authenticate. <p>

We know ***ACCESS-CI*** credentials work correctly so we will show that in our example.

!!! note "Other intstitution credentials"

     Please note that other CiLogon credentials (i.e. for your home institution or Google) must be set up outside of this process. Instructions for that will hopefully be available from ACCESS soon. We will link them here when available.


</br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-CiLogon-Auth-Screen.png){ align=right ; width=50% }

3. **ACCESS credentials**

* The next page should be the login screen for your credentials. We're showing the ACCESS login screen as our example.

</br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-Access-Duo-Screen.png){ align=right ; width=50% }

4. **Multi Factor Authentication**

* If you're using multi-factor authentication with your credentials as ACCESS does, you'll likely get a Duo or an Authenticator screen here.

</br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-Horizon-Home.png){ align=right ; width=50% }

5. **Horizon Dashboard**

* You should be at the Horizon Dashboard home now.

</br></br></br></br></br></br></br></br></br></br></br></br></br>

---

![](/images/JS2-Horizon-Change-Projects.png){ align=right ; width=50% }

6. **Project**

* If you are on multiple ACCESS allocations, you'll want to verify you're using the correct one and change to the correct one if you are not. </br></br>You do that by clicking at the top left next to the Jetstream2 logo where it has `ACCESS * AAA000000 * IU`. That will show allocations under "Projects".

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
