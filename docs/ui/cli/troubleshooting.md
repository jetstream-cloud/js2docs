# CLI Troubleshooting

#### I get an error authenticating doing openstack commands

If you source your openrc in a session that's had another openrc sourced from another cloud (inluding Jetstream1), you'll get an error like this:

    Error authenticating with application credential: Application credentials cannot request a scope. (HTTP 401) (Request-ID:

Please make sure to source the new Jetstream2 openrc in a fresh terminal session.

If you're feeling adventurous, you can do something like this to remove all previous OpenStack environment variables:

    while read -r varname; do unset "$varname"; done < <(env | grep ^OS_ | cut -d '=' -f1)

Please do that at your own risk. 
