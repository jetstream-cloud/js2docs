# Authenticating Against the OpenStack CLI (Logging In)

!!! note "New openrc format for Jetstream2 CLI!"
    When using Jetstream2's command line interface (CLI), know that its setup file (openrc) is not the same as Jetstream1's. For each Jetstream2 allocation you wish to access via the CLI, you must create a unique code called an 'application credential'. Begin by signing into [Horizon](../horizon/intro.md) with your ACCESS-CI account. Then, select the allocation and create an application credential. This guide provides the necessary steps.

The OpenStack <abbr title="Command-Line Interface">CLI</abbr> expects certain environment variables to be set when issuing commands; these environment variables are used to provide information/context about authenticating to the OpenStack API, for example where to find it (`$OS_AUTH_URL`) and what authentication method to use (`$OS_AUTH_TYPE`). If these are not properly provided, you might see a message like `Missing value auth-url required for auth plugin password`.

The easiest way to provide authentication information is by using an `openrc.sh` script:
```
source openrc-file-name
```

If you do not already have an `openrc` file, the next sections will walk you through how to create one.

---

## About openrc.sh files

#### Openrc files are private

Since they contain information about application credentials and secrets, just like a password or passphrase, you generally should not share your `openrc` file with anyone. 

Projects with multiple users should ideally have a unique application credential and corresponding `openrc` for **every user and every machine/client**! Following this practice can drastically reduce security risk and simplify the necessary response should the information in an `openrc` be compromised.

#### Always source an openrc in a fresh terminal session!
If you invoke it in a session that's had another openrc sourced (especially one for Jetstream1), you may get an error like this:

```
Error authenticating with application credential: Application credentials cannot request a scope.
```

Check your `.bashrc` file or any other similar ones to be sure an old `openrc` isn't being automatically sourced at login. Other troubleshooting items may be found [here](troubleshooting.md)

#### Openrc files are allocation-specific

Each allocation you wish to use from the command line will need its own application credential and openrc file.

---

## Setting up application credentials and openrc.sh for the Jetstream2 CLI

!!! warning "You **CANNOT** use the openrc generator like in Jetstream1"
    The openrc generator on the Horizon right side (username) menu will NOT work properly with Jetstream2! Please use the process below to get your application credential based openrc file.

### Using the Horizon dashboard to generate openrc.sh

<table>
  <tr>
    <th style="width: 40%; word-wrap: break-word;" !important>Action</th>
    <th>Screenshot</th>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>Navigate to <a href="https://js2.jetstream-cloud.org" target=_blank>https://js2.jetstream-cloud.org</a><p><p>Make sure it says "ACCESS CILogin" in the Authenticate Using box.</td>
    <td><a href="/images/JS2-Horizon-Login-Screen.png" target=_blank><img src="/images/JS2-Horizon-Login-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>The first time you log in you'll be directed to a CILogin page to permit authorization.<p>
    <p>If you have linked institutional, Google, Orcid, or other credentials, you'll be able to use those to authenticate.<p> We know ACCESS credentials work correctly so we will show that in our example.<p> </td>
    <td><a href="/images/JS2-CILogin-Screen.png" target=_blank><img src="/images/JS2-CILogin-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>The next page should be the login screen for your credentials. We're showing the ACCESS login screen as our example.</td>
    <td><a href="/images/JS2-CILogin-Auth-Screen.png" target=_blank><img src="/images/JS2-CILogin-Auth-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>If you're using two-factor auth with your credentials as ACCESS does, you'll likely get a Duo or Authenticator screen here.</td>
    <td><a href="/images/JS2-Access-Duo-Screen.png" target=_blank><img src="/images/JS2-Access-Duo-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>You should be at the Horizon Dashboard home now.</td>
    <td><a href="/images/JS2-Horizon-Home.png" target=_blank><img src="/images/JS2-Horizon-Home.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>As application credentials are unique to each allocation, if you are on multiple ACCESS allocations, you'll want to verify you're using the correct one and change to the correct one if you are not. <p><p>You do that by clicking at the top left next to the Jetstream2 logo where it has "ACCESS * AAA000000 * IU". That will show allocations under "Projects".</td>
    <td><a href="/images/JS2-Horizon-Change-Projects.png" target=_blank><img src="/images/JS2-Horizon-Change-Projects.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>From here, you'll select <b>Identity</b> and then <b>Application Credentials</b> from the sidebar menu on the left<p><p>
    Once on that page, you'll click "Create Application Credential" towards the top right (noted by the red arrow)</td>
    <td><a href="/images/JS2-App-Cred-Screen.png" target=_blank><img src="/images/JS2-App-Cred-Screen.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>This will bring up the application credential creation screen. <p>The sidebar has descriptions if you need help. <p> We recommend using a descriptive name and to put details in the description so you can easily see what it is for.<p><p>The <b>Secret</b> is the password or passphrase. We recommend using a strong password here or multi-word passphrase. As the page notes, you will not be able to retrieve it later if you forget it or delete the openrc file you generate.<p><p>Set the expiration date and time. If you do not set a date, it will default to TODAY as noted on the sidebar.<p><p>We do not recommend setting the roles, access rules, or selecting unrestricted unless you are an advanced user and understand the full implications of altering these.</td>
    <td><a href="/images/JS2-App-Cred-Create.png" target=_blank><img src="/images/JS2-App-Cred-Create.png"></a>
    </td>
  </tr>
  <tr>
    <td style="width: 40%; word-wrap: break-word;" !important>When you hit "Create Application Credential" it will then generate the credential and bring up a confirmation box. Please make sure to save the credential ID and secret if you need them for things other than the openrc. <p><p>To get the openrc for CLI access, please click the "Download openrc file" button referenced by the red arrow in the screenshot. That will download a plain text file for use with the Openstack CLI client <p><p>We recommend giving your new openrc file a descriptive name (e.g. openrc-TRA111111.sh, using the ACCESS project name or some other meaningful description.)</td>
    <td><a href="/images/JS2-Created-App-Cred.png" target=_blank><img src="/images/JS2-Created-App-Cred.png"></a>
    </td>
  </tr>
</table>
