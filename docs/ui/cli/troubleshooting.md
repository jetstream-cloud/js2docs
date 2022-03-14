# CLI Troubleshooting

#### I get an error requesting scope when authenticating and doing openstack commands

If you source your openrc in a session that's had another openrc sourced from another cloud (inluding Jetstream1), you'll get an error like this:

    Error authenticating with application credential: Application credentials cannot request a scope. (HTTP 401) (Request-ID:

Please make sure to source the new Jetstream2 openrc in a fresh terminal session.

If you're feeling adventurous, you can do something like this to remove all previous OpenStack environment variables:

    while read -r varname; do unset "$varname"; done < <(env | grep ^OS_ | cut -d '=' -f1)

Please do that at your own risk.

---

#### I get an error saying my request requires authentication after sourcing my application credential openrc.

If your application credential secret in the openrc contains some punctuation/special characters, you might see an error like this:

    The request you have made requires authentication. (HTTP 401) (Request-ID:

For example, if you had an ampersand in your credential password, it may have gotten escaped to **&amp;** instead of just the ampersand character. The same could happen for less than or greater than signs and potentially other special characters. Double check the openrc to verify that that has not happened.
