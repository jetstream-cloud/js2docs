# Using the Object Store on Jetstream2

The object store is presently experimental. It WILL be a production service in coming weeks/months, but is under active development presently. The object store is only available via Horizon and the CLI presently.
{: .note}

**Documentation will continue to evolve.**

The Jetstream object store utilizes Openstack Swift and is S3 compatible. You can utilize it via Horizon or the command line interface (CLI).

*Horizon instructions will be coming soon. Though it does not appear that you can generate the EC2 credentials in Horizon.*

#### Prerequisites

If the you want to use s3 compatibility, you’ll need to generate EC2 credentials. This assumes you already have the python-openstackclient installed and have generated an application credential for the CLI.

If you do not have an application credential openrc and CLI clients installed, please see these pages:

- [Creating an application credential and openrc on Jetstream2](https://docs.jetstream-cloud.org/ui/cli/openrc/){target=_blank}
- [Installing Openstack Clients](https://docs.jetstream-cloud.org/ui/cli/clients/){target=_blank}

#### Using the object store with s3api compatibility

Once you have sourced your application credential based openrc and installed the python-openstack and python-swiftclient client you will need to generate your ec2-style credentials.

The CLI command is:

    openstack ec2 credentials create

You can save the creds in a config to use from the CLI/programatically. It's generally kept in the text file ~/.aws/config and looks like this:


    [default]
    region=RegionOne
    aws_access_key_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    aws_secret_access_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

The endpoint you’ll need for S3 operations is https://js2.jetstream-cloud.org:8001/

For s3 style operations, you'll want to use the s3api functions. Those are documented here: https://docs.aws.amazon.com/cli/latest/reference/s3api/{target=_blank}

Using the [aws command line interface](https://aws.amazon.com/cli/){target=_blank} you can test operations.

    aws s3api --endpoint-url "https://js2.jetstream-cloud.org:8001/" create-bucket --bucket my_unique_bucket_name

and to add a file to the bucket:

    aws s3api --endpoint-url "https://js2.jetstream-cloud.org:8001/" put_object --bucket my_unique_bucket_name --key my_file.zip --body my_file.zip

and to see bucket contents:

    aws s3api --endpoint-url "https://js2.jetstream-cloud.org:8001/" list-objects --bucket my_unique_bucket_name

#### Trying the object store from the CLI using Swift

To use the OpenStack CLI natively with the object store, you’ll need the Swift client if you have not already installed it. You can install it by doing:

    pip install python-swiftclient

Once you have the Swift client installed, you can test it by doing:

    swift post my_unique_bucket_name

which will create a storage container called "my_unique_bucket_name". You can then list your buckets by doing:

    swift list

If you want to delete the test bucket, you can do:

    swift delete my_unique_bucket_name

As with all Openstack clients, you can see the full list of commands with

    swift help

**You can also add, remove, and otherwise work with swift containers (buckets in the S3 vernacular) in Horizon on the Project → Object Store → Containers tab.**
