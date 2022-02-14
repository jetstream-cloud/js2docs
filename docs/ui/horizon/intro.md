#Horizon

Horizon is a web-based GUI for interacting with the Openstack API. It is likely the most complete GUI for working with Openstack but isn't the fastest or most user-friendly. Almost all functionality that is available from the CLI is available in Horizon. [Exosphere](../exo/exo.md) and [Cacao](../atmo/intro.md) both provide subsets of Horizon functionality with more focus on ease of use.

That said, there are times you may need the more complete features of Horizon instead of the other GUI interfaces. This documentation will cover the basics of launching, using, and managing instances, using various storage options in Horizon, using container orchestration engines, and other aspects of using Openstack.

### Logging into horizon

<table>
  <tr>
    <th style="width: 40%; word-wrap: break-word;" !important>Action</th>
    <th>Screenshot</th>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>Navigate to <a href="https://js2.jetstream-cloud.org" target=_blank>https://js2.jetstream-cloud.org</a><p><p>Make sure it says "XSEDE Globus Auth" in the Authenticate Using box.</td>
    <td><a href="../../../images/JS2-Horizon-Login-Screen.png" target=_blank><img src="../../../images/JS2-Horizon-Login-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>The first time you log in you'll be directed to a Globus page to permit authorization.<p>
    <p>If you have linked institutional, Google, Orcid, or other credentials, you'll be able to use those to authenticate.<p> We know XSEDE credentials work correctly so we will show that in our example.<p> </td>
    <td><a href="../../../images/JS2-Globus-Screen.png" target=_blank><img src="../../../images/JS2-Globus-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>The next page should be the login screen for your credentials. We're showing the XSEDE login screen as our example.</td>
    <td><a href="../../../images/JS2-XSEDE-Auth-Screen.png" target=_blank><img src="../../../images/JS2-XSEDE-Auth-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>If you're using two-factor auth with your credentials as XSEDE does, you'll likely get a Duo or Authenticator screen here.</td>
    <td><a href="../../../images/JS2-XSEDE-Duo-Screen.png" target=_blank><img src="../../../images/JS2-XSEDE-Duo-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>You should be at the Horizon Dashboard home now.</td>
    <td><a href="../../../images/JS2-Horizon-Home.png" target=_blank><img src="../../../images/JS2-Horizon-Home.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>If you are on multiple XSEDE allocations, you'll want to verify you're using the correct one and change to the correct one if you are not. <p><p>You do that by clicking at the top left next to the Jetstream2 logo where it has "XSEDE * TG-XXXXXXXXX * IU". That will show allocations under "Projects".</td>
    <td><a href="../../../images/JS2-Horizon-Change-Projects.png" target=_blank><img src="../../../images/JS2-Horizon-Change-Projects.png"></a>
    </td>
  </tr>
</table>

### Getting started with Horizon

* [Creating and managing security groups](security_group.md)
* [Creating networks](network.md)
* [Launching an instance](launch.md)
* [Managing instances](manage.md)
* [Using volumes](storage.md)
* [Using Manila shares](manila.md)
* [Troubleshooting in Horizon](troubleshooting,md)
