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

For example, if you had an ampersand in your credential password, it may have gotten escaped to **\&amp\;** instead of just the ampersand character. The same could happen for less than or greater than signs and potentially other special characters. Double check the openrc to verify that that has not happened.

#### I get an error when trying to `source` my openrc file

If your **secret** (password/passphrase) contains spaces, the openrc.sh file that Horizon generates may not have the field properly enclosed in quotes, resulting in an error message similar to `export: 'example!' not a valid identifier`.

Simply open the file in the text editor of your choice and edit the line `export OS_APPLICATION_CREDENTIAL_SECRET`. For example: 

1. `vi openrc.sh`
2. Press `i` to enter insertion mode
3. Change `export OS_APPLICATION_CREDENTIAL_SECRET=secret example!` to `export OS_APPLICATION_CREDENTIAL_SECRET="secret example!"`
4. Press `esc` and type `:wq`, then hit `enter` to save your changes.

### View the console log

Sometimes you may need to look at the console log for troubleshooting purposes or even just to see if the boot completed normally. You can do this with

    openstack console log show my-server-name-or-UUID
