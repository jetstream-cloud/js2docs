![cacao logo](images/cacao-logo.png){ width=128px }[CACAO Overview](overview.md) &gg; CACAO CLI Deploying Cloud Resources

# CACAO CLI: Deploying Cloud Resources Introduction

If you are a command-line user, you can use the CACAO CLI to deploy cloud resources, defined by an imported template within CACAO. The CACAO CLI is a Go program that can be installed on any system. Before you can use the CACAO CLI to deploy cloud resources, you must first install the CACAO CLI and login using an API token. See [CACAO CLI Login](cacao_cli_login.md) for more information.

Most users will want to use the CACAO user interface to deploy cloud resources; however, there may be use cases where you want to deploy cloud resources from the command line to automate CACAO from scripts or the flexibility of using files to configure resources. This tutorial is for you.

The process to deploy cloud resources with the CACAO CLI is described as follows:

1. Deployment: Collect the required input information

- Workspace ID
- Provider ID
- Credential ID
- Template ID

2. Deployment: Use the CACAO CLI to create a deployment object
4. Deployment Run: Use the CLI to create a deployment run object with the JSON file

Here are some additional notes about the process:

* A Deployment is a meta-object that describes a cloud resources and the metadata separate from the tasks that create, update, or delete cloud resources. A Deployment Run is a specific creation or modification of a Deployment object, which includes state information (like power state) and parameter information for the template. This separation will allow advanced users to interact with cloud resources like a workflow more easily and in the future have these cloud resources respond to external sources, such as triggering an execution when data changes rather than one-time deployments.
* Any state changes, such as changing the `power_state` from `active` to `shutoff`, requires a new Deployment Run object to be created. This can easily be done by modifying the JSON file and re-running the `cacao deployment-run create` command.
* The output of the cacao cli is a JSON-formatted response. For convenience, you can use the `jq` cli command to "prettify" the JSON output. For example, `cacao workspace get | jq` will return a human-readable version of json from the list of workspaces or `cacao workspace get | jq '.[0].id` will return the workspace id from the first element in the workspace list.
* You can use the CLI to also create cloud and ssh credentials but it will be easier create credentials using the CACAO user interface before attempting a deployment. See [Credentials tutorial](credentials.md) for more information.

## Deployment: Collect the required input information

1. Obtain the workspace `id` for "Default Workspace" (there should only be one workspace): `cacao workspace get`
2. Obtain the provider `id` for "Jetstream 2". If you have more than one provider, be sure to select the Jetstream2 provider id: `cacao provider get`
3. Obtain the Jetstream2 credential `id` for your ACCESS allocation. See ***Note 4*** above: `cacao credential get`
4. Obtain the template `id` for the template you wish to deploy. See [Templates tutorial](templates.md) for more information: `cacao template get`

## Deployment: Use the CACAO CLI to create a deployment object

You can now use the CACAO CLI to create a Deployment object. A Deployment is needed to create a Deployment Run object, which ultimately creates cloud resources. Using the information you obtained from the previous section, you can construct the cacao cli command to create a Deployment object. The format will be similar to:

```bash
cacao deployment create <workspaceID> <templateID> <providerID> --cloud-creds <credentialID> --name <the name of my deployment>
```

Below is an example cacao cli along with example output, a json-formatted response. Your ids will likely be different. 

```bash
cacao deployment create workspace-cb84e8j761e3iagh6123 template-cb75nk6he38e5pi5k456 provider-cb6q6ruhe388cqs04098 --cloud-creds cred-cdgrubj761efbe3v7734 --name esprod-cacaocli-0130
{
    "tid": "deployment-cm1mnlhetpqfb6q4u23g",
    "timestamp": "2024-01-30T21:36:22.422622628Z"
}
```

The Deployment id, indicated by the `tid` field from the output, is needed to create the a Deployment Run. Copy this id.

# Deployment Run: Use the CLI to create a deployment run object with the JSON file

To create a Deployment Run, you can use example JSON file below. Simply copy and paste into a new file using your favorite editor. In this example, this file is named  `deployment_run.json`, but you can name it whatever you desire; This example JSON file only works for the openstack-single-image template and other templates will likely require different parameters. To view a template's parameter list, use the following command, `cacao template get <template-id>`, to view the accepted `parameters`. 

You will need to modify the values with the information that you collected from the previous sections and set the template parameters according to the template you are using.

***NOTE 1:*** The `deployment_id` is the same deployment id outputted in the previous section

***NOTE 2:*** The `cloud_credentials` must be the same cloud credentials used to create the deployment object.

***NOTE 3:*** Some template parameters will likely reference openstack specific values, such as a `flavor` and `image_name`. You can use the CLI `cacao provider` operation to get this information. It is also just as easy to use the openstack cli or Horizon ([https://js2.jetstream-cloud.org](https://js2.jetstream-cloud.org)) to get this information.


```json
{
    "deployment_id": "deployment-cm1mnlhetpqfb6q4u23g",
    "cloud_credentials": ["cred-cdgrubj761efbe3v7734"],
    "git_credential_id": "",
    "parameters": [
        {
            "key": "flavor",
            "value": "m3.tiny"
        },
        {
            "key": "project",
            "value": "MY-ACCESS-PROJECT"
        },        
        {
            "key": "image_name",
            "value": "Featured-Ubuntu22"
        },
        {
            "key": "instance_count",
            "value": "1"
        },
        {
            "key": "instance_name",
            "value": "my-cacao-instance"
        },
        {
            "key": "power_state",
            "value": "active"
        }
    ]
}
```

After the JSON file has been created, you can create a Deployment Runy with a simple command:

```bash
cacao run create -f run.json
{
    "tid": "run-cmsov31etpqfb6q4ugu0",
    "timestamp": "2024-01-31T00:08:44.763310345Z"
}
```

# Deployment Run: Use the CLI to "update" or change the state a deployment object with the JSON file

To update the Deployment, you need to create a new Deployment Run to reflect the changed state.

For example, to update the `power_state`, you can simply change the value in the JSON file and re-run the `cacao run create -f run.json` command. 

***Note 1:*** For instance type deployments, the `power_state` parameter can be set to the following

* `active`
* `shutoff`
* `suspendd`
* `shelved_offloaded`

***Note 2:*** When you change the state of a Deployment Run, you may need to refresh the browser in the UI to see the updated state.

Here is the updated JSON file with the `power_state` set to `shutoff`:

```json
{
    "deployment_id": "deployment-cm1mnlhetpqfb6q4u23g",
    "cloud_credentials": ["cred-cdgrubj761efbe3v7734"],
    "git_credential_id": "",
    "parameters": [
        {
            "key": "flavor",
            "value": "m3.tiny"
        },
        {
            "key": "project",
            "value": "MY-ACCESS-PROJECT"
        },        
        {
            "key": "image_name",
            "value": "Featured-Ubuntu22"
        },
        {
            "key": "instance_count",
            "value": "1"
        },
        {
            "key": "instance_name",
            "value": "my-cacao-instance"
        },
        {
            "key": "power_state",
            "value": "shutoff"
        }
    ]
}
```

# Deployment Run: Use the CLI to "delete" the Deployment

To delete a Deployment, you can simply use the `cacao deployment delete` command, such as:

```bash
cacao deployment delete deployment-cmsmnlhetpqfb6q4ufpg
{
    "id": "deployment-cmsmnlhetpqfb6z4ufpg",
    "tid": "deployment-cmsmnlhetpqfb6q4ufp0",
    "timestamp": "2024-01-31T00:20:57.773777446Z"
}
```