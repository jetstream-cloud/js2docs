# CLI Troubleshooting

#### I get an error authenticating doing openstack commands

If you source your openrc in a session that's had another openrc sourced from another cloud (inluding Jetstream1), you'll get an error like this:

    Error authenticating with application credential: Application credentials cannot request a scope. (HTTP 401) (Request-ID:

Please make sure to source the new Jetstream2 openrc in a fresh terminal session.
