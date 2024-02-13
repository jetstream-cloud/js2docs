![cacao logo](images/cacao-logo.png){ width=128px }[CACAO Overview](overview.md) &gg; CACAO CLI Importing a Terraform Template

# Why create my own Terraform templates?

When using CACAO, it is natural to ask, "Why create a Terraform template and why import into CACAO?" The answer for the first question is that typically a new template might be needed because there isn't an existing Terraform template that does exactly what you need. Terraform wonderfully orchestrates the creation of cloud resources, such as multiple virtual machine instances with networking and storage. Coupled with Terraform's [`local-exec` provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec){target=_blank}, which allows the execution of Ansible or external programs, Terraform is a powerful software to deploy, install, and configure any virtualized research infrastructure or research software stack declaratively.

By importing templates into the platform, CACAO exposes Terraform templates and templates in other languages in a reproducible way, while giving users an interface to do point-n-click deployments without needing expertise in Terraform, Ansible, or OpenStack.

Another question that is natural to ask, "Do I need to create templates myself?". The answer is only if you need and you might need to create a template from scratch. Because CACAO assumes templates are stored in git and if you need a customized template, the recommended approach is to "fork" a template repo using git (instructions in [github](https://docs.github.com/en/get-started/quickstart/fork-a-repo){target=_blank} and [gitlab](https://docs.gitlab.com/ee/user/project/repository/forking_workflow.html){target=_blank}) and modify the template code to suit your needs. 

You or a fellow Research Software Professional can also create Terraform templates de novo. This page will provide the necessary information to construct a terraform template from scratch.

# Prerequisite background for importing Terraform templates into CACAO

This page will focus on the steps required to import an existing Terraform template repo, rather than Terraform itself.

If you need instructions on the creation of a template, there are plenty of online resources that are available to teach you the basics on creating and using Terraform. Here are some example tutorials:

* [Terraform Tutorials from Hashicorp](https://developer.hashicorp.com/terraform/tutorials){target=_blank}
* [Learn Basic Terraform Syntax in 20 minutes from freecodecamp.org](https://www.freecodecamp.org/news/terraform-syntax-for-beginners/){target=_blank}
* [Terraform 101 from towardsdatascience.com](https://towardsdatascience.com/terraform-101-d51437a3170){target=_blank}

CyVerse also has a [Cloud Native Camp](https://cc.cyverse.org/getting_started/schedule/){target=_blank} that will provides hands-on training in using Cloud Native tools and includes Terraform.

# Steps to import a template

### Overview

The steps to import a terraform template are as follows:

1. Create a git repo containing the terraform files (not covered by this page)
2. Create a `.cacao/metadata.json` file
3. Create a `.cacao/ui.json` file
4. Import the template using the CACAO CLI
5. Verify the deployment of the template using the CACAO User Interface

As mentioned, Step 1 will not be covered by this page since there are plenty of online resources that cover creating a git repo.

### Step 2: Create a `.cacao/metadata.json` file

The `.cacao/metadata.json` is a required json file needed for CACAO to properly import the template and determine its purpose. The following table highlights the optional and required fields that go into the metadata file:

| field  | required? | type | description |
|--------|--------------|------|-------------|
| `schema_url` | yes | string | should always be `https://gitlab.com/cyverse/cacao-common/-/raw/master/template/metadata-schemas/v3/schema.json` | 
| `schema_version` | yes | string | should always be `"3"` |
| `name` | yes | string | Default name of template; Can be changed while imported |
| `author` | yes | string | The author name for the template, not to be confused with the user who imports a template |
| `author_email` | yes | string | The author's email |
| `description` | yes | string | The description of the template. This should be short and sweet. |
| `doc_url` | no | string | The URL of the document that expains how to use the template |
| `template_type` | yes | string | The type of the template and typically captures the language and cloud combination. For Terraform that primarily runs on Openstack, use `openstack_terraform` |
| `purpose` | yes | string | The purpose of the template, and typically captures the cloud and type of resources. This should be `openstack_compute`, though future purposes values will include storage |
| `published_versions` | no | array of strings | The list of git releases of the template code that are compatible. By default, `main` branch is used. |
| `cacao_pre_tasks` | no | array of values | reserved, not yet implemented |
| `cacao_post_tasks` | no | array of values | reserved, not yet implemented |
| `parameters` | yes | array of parameters | see below |
| `filters` | no | array of values | reserved, not yet implemented |

The `parameters` field defines the input values that are configurable for the template. A properties of a parameter can include the following:

* `name`, the name of the parameter to pass as part of the deployment for a template
* `type`, the type for the parameter
* `description`, a short description of the parameter
* `default`, the default value if the value for the parameter is empty or unset
* `enum`, if defined, an enumerated list of values that may be used for the parameter
* `required`, if set true, the parameter is should be input
* `editable`, if set true, the parameter is editable via UI
* `base64`, if set true, the parameter will have Base64 encoded value

The following table shows the parameter types that may be used within the `parameters` field. Two parameter fields `instance_name` and `power_state` are unique fields that must be declared by name and are of type `string` -- future releases of CACAO will reference these parameters as parameter types, rather than by names.

| parameter type | required? | declare<br/>by name? |description |
|----------------|--------------|----------------|------------|
| `instance_name`*| yes | yes | This is a special parameter that must exist by name, the type field should be `string`, and will be used as the deployment name |
| `power_state`* | yes | yes | This is a special parameter that must exist by name, the type will be `string`, and can only be the following values: <br/>"active", "shutoff", "suspend", and "shelved_offloaded"  |
| `cacao_provider_key_pair` | yes | no | Required by CACAO for ssh key injection; do not expose through the user interface  |
| `cacao_cloud_init` | yes | no | Required by CACAO for ssh key injection; do not expose through the user interface |
| `cacao_provider_project` | no | no | A string representing the OpenStack project |
| `cacao_provider_region` | no | no | A string representing the OpenStack region, such as "IU" |
| `cacao_provider_image` | no | no | A string representing the OpenStack image uuid |
| `cacao_provider_image_name` | no | no | A string representing the OpenStack image name |
| `cacao_provider_flavor` | no | no | A string representing the OpenStack image flavor  |
| `cacao_username` | no | no | A string representing the CACAO username e.g. `myuser@access-ci.org` |
| `cacao_username_unix` | no | no | A string representing the CACAO username without the at sign, if federated identity e.g `myuser` |
| `cacao_user_ssh_key_all_json` | no | no | A string representing the all user's ssh key that would normally be injected into cloud-init in json format; use this if the template already provides or cannot use CACAO-defined cloud-init or `cacao_cloud_init` parameter |
| `cacao_ssh_key` | no | no | CACAO's public ssh key, which may be needed for template provisioners or ansible. use this if your template already provides or cannot use a CACAO-defined cloud-init, which contains cacao's public ssh key, or the `cacao_cloud_init` parameter |
| `cacao_white_list_cidr_json` | no | no | A string representing the cidr block that can be used to whitelist cacao ips, which is useful for configuring services like fail2ban |
| `cacao_provider_project` | no | no | A string representing the OpenStack project |
| `string` | no | no | a basic string type  |
| `integer` | no | no | a basic integer type  |
| `bool` | no | no | a basic boolean type, either `true` or `false`  |

**Tips when declaring input parameters**

* Multiple parameters may declare cacao-defined types. For example, leader-worker templates might define more than one `cacao_provider_flavor` parameter type, one for the leader and a separate `cacao_provider_flavor` parameter for the workers.
* Use `enum` property to restrict values
* Use `default` property to set a reasonable default whenever possible

** To view an example `.cacao/metadata.json` **<details>
    <summary>CLICK HERE</summary>
```json
{
  "schema_url": "https://gitlab.com/cyverse/cacao-common/-/raw/master/template/metadata-schemas/v3/schema.json",
  "schema_version": "3",
  "name": "hello-world",
  "author": "Me MyselfandI",
  "author_email": "me@myselfi.edu",
  "description": "my hello world example",
  "template_type": "openstack_terraform",
  "purpose": "openstack_compute",
  "cacao_pre_tasks": [],
  "cacao_post_tasks": [],
  "parameters": [
    {
      "name": "project",
      "type": "cacao_provider_project",
      "description": "OpenStack Project ID"
    },
    {
      "name": "region",
      "type": "cacao_provider_region",
      "default": "IU",
      "description": "Openstack region"
    },
    {
      "name": "instance_name",
      "type": "string",
      "description": "Instance name"
    },
    {
      "name": "image",
      "type": "cacao_provider_image",
      "default": "",
      "description": "Boot image id"
    },
    {
      "name": "flavor",
      "type": "cacao_provider_flavor",
      "description": "Instance type"
    },
    {
      "name": "keypair",
      "type": "cacao_provider_key_pair",
      "default": "cacao-ssh-key",
      "description": "Key-pair for instance access"
    },
    {
      "name": "power_state",
      "type": "string",
      "default": "active",
      "description": "Power state",
      "enum": [
        "active",
        "shutoff",
        "suspend",
        "shelved_offloaded"
      ]
    },
    {
      "name": "user_data",
      "type": "cacao_cloud_init",
      "description": "cloud init script"
    }
  ]
}
```
</details>
<br/>
<br/>

### Step 3: Create a `.cacao/ui.json` file

The `.cacao/ui.json` is an optional json file used to provide hints on the layout and rendering for the user interface. The following table lists the optional and required fields that go into the `.cacao/ui.json` file.

| field  | required? | type | description |
|--------|--------------|------|-------------|
| `schema_url` | yes | string | should always be `https://gitlab.com/cyverse/cacao-common/-/raw/master/template/ui-schemas/v1/schema.json` | 
| `schema_version` | yes | string | should always be `"1"` | 
| `author` | no | string | The author name for the template, not to be confused with the user who imports a template |
| `author_email` | no | string | The author's email |
| `description` | no | string | The description of the template. This should be short and sweet. |
| `doc_url` | no | string | The URL of the document that expains how to use the template |
| `steps` | yes | array of steps | see below |

The `steps` field defines an ordered array of steps in the deployment wizard, each step referring to a new view or page.

Each step will have the following properties
`title`, a string containing the title of that step in the deployment wizard
`items`, an array of ui elements

The following are types of ui elements that can be included in `items`:

* **ui field**, a general ui element, which maps to a parameter. An example ui field:
```json
    {
        "name": "region",
        "ui_label": "Choose Region",
        "help_text": "Choose region where you want to run the instance on"
    }
```

* **row**, a container allows one or more ui fields to exist in the same row of a page. A row will contain its own `items` property. An example row field:
```json
    {
        "type": "row",
        "items":[
            {
                "name": "flavor",
                "ui_label": "Size"
            }
        ]
    }
```


**To view an example `.cacao/ui.json`** <details>
    <summary>CLICK HERE</summary>
```json
{
    "schema_url": "https://gitlab.com/cyverse/cacao-common/-/raw/master/template/ui-schemas/v1/schema.json",
    "schema_version": "1",
    "author": "Me MyselfandI",
    "author_email": "me@myselfi.edu",
    "steps": [
        {
            "title": "Parameters",
            "items": [
                {
                    "name": "region",
                    "ui_label": "Choose Region"
                },
                {
                    "name": "instance_name",
                    "ui_label": "Instance name"
                },
                {
                    "name": "power_state",
                    "ui_label": "Power state"
                },
                {
                    "name": "image",
                    "ui_label": "Image"
                },
                {
                    "type": "row",
                    "items":[
                        {
                            "name": "flavor",
                            "ui_label": "Size"
                        }
                    ]
                }
            ]
        }
    ]
}
```
</details>
<br/>
<br/>

### Step 4: Import the template using the CACAO CLI

Once the `.cacao/metadata.json` and optionally the `.cacao/ui.json` have been created, template authors will need to use the CACAO command line tool to import or manage templates.

To import a template, follow these steps

0. **Download the `cacao` binary from [https://gitlab.com/cyverse/cacao/-/packages/16741734](https://gitlab.com/cyverse/cacao/-/packages/16741734){target=_blank}**

Once you download the binary appropriate for your system, you may want to rename the file to `cacao` and add the path to your system or user's `PATH` variable. If you don't update your PATH, you may need to prefix the binary with a relative or absolute path to properly use the cli tool e.g. `./cacao` or `/home/myusername/cacao`.

1. **Login to through the CACAO cli**

Using `cacao` requires a valid login, which for Jetstream2 will use ACCESS-CI/CILogon OpenID Connect. 

**1.a. `cacao login --browser`**

After entering `cacao login --browser`, you will see the following text:

```bash
Please provide address of Cacao API.
Format Should be: http://<hostname>:<port>        or    <hostname>:<port>
(Developers: this should match the value of API_DOMAIN in install/config.yaml followed by "/api", e.g. ca.cyverse.local/api)
Cacao API address (http://ca.cyverse.local/api):
```

**1.b. Enter `https://cacao.jetstream-cloud.org/api` as the Cacao API address.**

The following text will be displayed
```bash
Please go to this URL in the browser: https://cacao.jetstream-cloud.org/api/user/login

After login, you should get a JSON response, the auth token could be the value of following properties:
- "IDToken" or "id_token" if keycloak
- "access_token" if other auth provider

Enter the auth token you get from browser:
```

**1.c. In a browser, go to https://cacao.jetstream-cloud.org/api/user/login**

**1.d. Login to ACCESS-CI as you typically would, including any MFA.** 

If you encounter any issues with login, you should consider clearing your cache and setting your identity provider to **"ACCESS CI (XSEDE)"**.

**1.e. Obtain the access token from ACCESS CI/CILogon**

After a successful login using the browser, you should see a json string similar to following. 
```json
{"access_token":"<random alphanumeric text>","token_type":"Bearer","refresh_token":"<different random alphanumeric text>","expiry":"2023-08-11T03:39:10.767331507Z"}
```
1.F. Past the following text as your auth token:
```bash
Bearer <copied value between quotes for access_token>
```
You will want to copy the text between the quotes for `access_token`, and then as your complete auth token string, you will need to add the string "Bearer" (yes, capital B), one space, and then the `access_token` value.

After entering your auth token, you should not receive any error messages.

2. **Verify a successful login**

You can use `cacao user get` or `cacao provider get`, which should list your user or the list of providers respectively. 

If don't get successful results from those commands, then you can always `cacao logout` and re-attempt the login process again.

3. `cacao template create git <source url>  <template name> --branch <git branch> --path <path to template>`

Some explanation is required for the arguments to `cacao template create` command. First of all, this command initiates an import of a template that is stored in a git repository. Future versions of cacao may allow templates to be stored in other types of source repositories.

The `source url` should be the same url used when cloning a git repo.

The `template name` sets the name of the template in CACAO.

The `--branch <git branch>` configures the template to use and monitor a specific branch. If in doubt, you can use `main` (or `master` for older git repos).

The `--path <path to template>` configures a path within the repo to use for the template. This is useful when there may be multiple templates within the same repository. If the template exists at the root of the repo, then use `"."`

Putting this all together, an example `cacao template create` command and result may look like the following:
```bash
cacao template create git https://gitlab.com/stack0/cacao-tf-hello-world.git my-hello-world --branch main --path . 
{
    "tid": "template-cjar0vghrec6nau88p10",
    "timestamp": "2023-08-11T03:52:31.487802016Z"
}
```
The result will contain a timestamp and a template id, which you can use to manage the template in the future.

### Step 5: Verify the deployment of the template using the CACAO User Interface

After a successful template import into CACAO, you should be able to login to the CACAO user interface and deploy the template in the Deployments section.

# Maintenance of your template in CACAO

Whenever you update the template code in git on the configured branch, then CACAO will automatically pull the most recent code for new deployments. No additional configuration is needed for CACAO to automatically use the updated code.

However, whenever you update the metadata of the template, either the `.cacao/metadata.json` or the `.cacao/ui.json`, you will need to resync the metadata in CACAO, which is currently only possible using the command line. An example of such a command line is:

    cacao template sync <template-id>

`<template-id>` is the id for the template that has the updated metadata.

You can use the `cacao template delete <template-id>` to delete the template.
