# Exosphere Troubleshooting

### I changed the exouser password on my instance and now the web shell and web desktop in Exosphere don't work.

The way Jetstream2 is currently architected, all users on an allocation have access to all resources on the allocation. By default, Exosphere hides some resources created by other users, but this is only a convenience and it cannot assure separation of access.

It is possible to make it less straightforward for another user on the same allocation to access your running instance. You can do this by changing the password for the default exouser account. Changing the password does not prevent any access, but makes it more difficult.

Currently, changing the exouser account password will break Web Shell, Web Desktop, and some other Exosphere-powered instance interactions. This may change in the future.
{: .note}
