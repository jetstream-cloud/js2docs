# Security Group Management in Horizon

Security groups can be thought of like firewalls. They ultimately control inbound and outbound traffic to your virtual machines. Under the CLI and Horizon, access defaults to all outbound allowed and **NO** inbound allowed.

To allow access to your VM for things like SSH, you will need to create a security group and add rules to it.

> *You can reuse a security group many times, so a best practice is to create groups by related services. For insance, you might create a basic group for ssh and icmp (which is what we will show as an example) and then a separate security group for http and https access if you're running a web service on your instance.*
{: .note}

### Creating Security Groups and Rules

This will walk you through creating a basic security group in Horizon and adding a couple of simple access rules.

---

![](../../../images/Security-group-create-group.png){ align=right ; width=50% }

In the popup box that comes up, you'll give your new security group a name (we suggest something like *my-username-ssh-and-icmp*) and optional description. We recommend giving a meaningful name and noting in the description what your intended purpose is.

</br></br></br></br></br></br></br></br>

---

<table>
  <tr>
    <th style="width: 40%; word-wrap: break-word;" !important>Action</th>
    <th>Screenshot</th>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>Login to the <a href="https://js2.jetstream-cloud.org" target=_blank>Horizon dashboard and</a> make sure you've selected the correct allocation. Select the "Network" tab on the sidebar and click "Security Groups".</td>
    <td><a href="../../../images/Security-group-open-page.png" target=_blank><img src="../../../images/Security-group-open-page.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>Once you're on the security group page, you'll need to click the "Create Security Group" button (noted with a red arrow on the screenshot)</td>
    <td><a href="../../../images/Security-group-page.png" target=_blank><img src="../../../images/Security-group-page.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-  wrap: break-word;" !important>In the popup box that comes up, you'll give your new security group a name (we suggest something like *my-username-ssh-and-icmp*) and optional description. We recommend giving a meaningful name and noting in the description what your intended purpose is.</td>
    <td><a href="../../../images/Security-group-create-group.png" target=_blank><img src="../../../images/Security-group-create-group.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>When the creation is successful, it will bring you back to the security group page and note the success in the corner with a green status message. You'll see your new group name at the top where it says **Manage Security Group Rules: your-rule-name**.<p><p>You'll then want to click "Add Rule" (noted with a red arrow on the screenshot)</td>
    <td><a href="../../../images/Security-group-create-success.png" target=_blank><img src="../../../images/Security-group-create-success.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>This will bring up a new dialog box where you can select the parameters for your security group rule.</td>
    <td><a href="../../../images/Security-group-add-rule.png" target=_blank><img src="../../../images/Security-group-add-rule.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>If you click the "Rule" dropdown at the top, you'll see a list of common rule types as well as the option for custom rules. For this example, we'll select "SSH" to allow inbound port 22/SSH access.</td>
    <td><a href="../../../images/Security-group-add-rule-type.png" target=_blank><img src="../../../images/Security-group-add-rule-type.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>We'll fill in the other details needed. We do recommend putting in a description with what the rule does so it's easy to see at a glance. We'll also select CIDR as the remote type and then set *0.0.0.0/0* as the CIDR. This allows all traffic to the SSH port. <p><p>You can make that be a single IP or a specific CIDR block. <p><p>In general, limiting access to specific CIDR blocks or IPs is best.</br></br>For example, you could specify *129.114.36.0/22* to limit connections to only Jetstream2 VMs at the TACC regional location.</td>
    <td><a href="../../../images/Security-group-add-rule-details.png" target=_blank><img src="../../../images/Security-group-add-rule-details.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>When the creation is successful, it will bring you back to the security group page and note the success in the corner with a green status message. You'll see your new rule now on the page.</td>
    <td><a href="../../../images/Security-group-add-rule-success.png" target=_blank><img src="../../../images/Security-group-add-rule-success.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>You'll need to click the "Create Security Group" button and second time and we'll create a second rule for "All ICMP". This will allow things like incoming ping to check the status of your virtual machine. You'll select *Ingress*, *CIDR*, and set the CIDR to *0.0.0.0/0* to allow all hosts to ping your virtual machine. </td>
    <td><a href="../../../images/Security-group-add-second-rule.png" target=_blank><img src="../../../images/Security-group-add-second-rule.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>As before, when the creation is successful, it will bring you back to the security group page and note the success in the corner with a green status message. You'll see your new rule now on the page.</td>
    <td><a href="../../../images/Security-group-add-second-rule-success.png" target=_blank><img src="../../../images/Security-group-add-second-rule-success.png"></a>
    </td>
  </tr>
</table>

You can then add additional rules or additional security groups. This will allow the most basic of access to your VMs.

**We do recommend limiting access as much as possible for best security practices.**
{: .note}
