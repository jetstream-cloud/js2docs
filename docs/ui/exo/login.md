# Exosphere: Logging In

## Using XSEDE Account (single sign-on)

The default login method uses your XSEDE account credentials. Note that this may require multi-factor (Duo) authentication. (If you need help setting up or changing your multi-factor authentication method, please open an XSEDE ticket, as Jetstream2 staff cannot fix this for you directly.)

## Choosing Allocations and Regions

After you log in with your XSEDE credentials, Exosphere will prompt you to select from the allocations that you are a member of. Any un-selected allocations will not be added the Exosphere interface, so select all that you may want to use. If you are granted access to a Jetstream2 regional cloud, you will be logged into those allocations in both the main (Indiana University) region and any other regions.

## Logging into non-Jetstream Clouds in Exosphere

The Exosphere interface for Jetstream2 also allows you to manage resources on other OpenStack-based research clouds alongside Jetstream2. In order for this to work, these third-party clouds must expose their OpenStack APIs publicly, and you must have OpenStack credentials (or an OpenRC file) to provide. To add other clouds, choose "Add allocation", select "Other login methods", and pick the "OpenStack" login method.

If you encounter difficulty adding non-Jetstream2 clouds to Exosphere, Jetstream2 staff will have limited ability to troubleshoot and help, so this capability is not guaranteed to work.