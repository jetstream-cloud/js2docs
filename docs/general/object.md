# Using the Object Store on Jetstream2

The object store is only available via Horizon and the CLI presently.
{: .note}

The Jetstream2 object store utilizes Openstack Swift and is S3 compatible. You can utilize it via Horizon or the command line interface (CLI). From the CLI, you can use the python-swiftclient, the [AWS CLI's `s3api`](../s3/#aws-cli), or other compatible tools.

#### Trying the object store from the CLI using Swift

To use the OpenStack CLI natively with the object store, you’ll need the Swift client if you have not already installed it. You can install it by doing:

    pip install python-swiftclient

Once you have the Swift client installed, you can test it by doing:

    swift post my-unique-bucket-name

which will create a storage container called "my-unique-bucket-name". You can then list your buckets by doing:

    swift list

If you want to delete the test bucket, you can do:

    swift delete my-unique-bucket-name

As with all Openstack clients, you can see the full list of commands with

    swift help

**You can also add, remove, and otherwise work with swift containers (buckets in the S3 vernacular) in Horizon on the Project → Object Store → Containers tab.**
