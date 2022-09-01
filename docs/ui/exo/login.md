# Exosphere: Logging In

## Using ACCESS Account (single sign-on)

The default login method uses your ACCESS account credentials. Note that this may require multi-factor (Duo) authentication. (If you need help setting up or changing your multi-factor authentication method, please open an [ACCESS Help Ticket](https://support.access-ci.org/user/login?destination=/open-a-ticket){target=_blank}, as Jetstream2 staff cannot fix this for you directly.)

You will be directed to a CILogon page to permit authorization the first time and any time your are using a new browser or your credentials go stale.

If you have linked institutional, Google, Orcid, or other credentials **PREVIOUSLY** with CILogon, you’ll be able to use those to authenticate. We know ACCESS-CI credentials work correctly and recommend using that as the setting unless you are 100% sure you have linked your credentials with CILogon (previously linked credentials in XSEDE using Globus do NOT carry over).

!!! note "Other intstitution credentials"

     Please note that other CILogon credentials (i.e. for your home institution or Google) must be set up outside of this process. Instructions for that will hopefully be available from ACCESS soon. We will link them here when available.

## Choosing Allocations and Regions

After you log in with your ACCESS credentials, Exosphere will prompt you to select from the allocations that you are a member of. Any un-selected allocations will not be added the Exosphere interface, so select all that you may want to use. If you are granted access to a Jetstream2 regional cloud, you will be logged into those allocations in both the main (Indiana University) region and any other regions.

## Logging into non-Jetstream Clouds in Exosphere

The Exosphere interface for Jetstream2 also allows you to manage resources on other OpenStack-based research clouds alongside Jetstream2. In order for this to work, these third-party clouds must expose their OpenStack APIs publicly, and you must have OpenStack credentials (or an OpenRC file) to provide. To add other clouds, choose "Add allocation", select "Other login methods", and pick the "OpenStack" login method.

If you encounter difficulty adding non-Jetstream2 clouds to Exosphere, Jetstream2 staff will have limited ability to troubleshoot and help, so this capability is not guaranteed to work.
