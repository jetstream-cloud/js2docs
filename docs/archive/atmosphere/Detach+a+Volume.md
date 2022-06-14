# Detach a Volume

In order to remove a _Volume_ from an active Instance, it must be detached. **Volumes can only be detached from _ACTIVE_ instances**.

Files/data saved to a _Volume_ is maintained across successive attachment/detachment actions.



From the Jetstream Atmosphere Dashboard:

* Click on `PROJECTS`
* Select your Project
* Select the desired Volume and click `Detach`

    !!! warning "WARNING:"

        If data is being written to the volume when it's detached, the data may become corrupted. Therefore, we recommend you make sure there is no data being written to the volume before detaching it.

* Click `Yes, Detach the Volume`

    !!! note "NOTE:"

        A Volume will fail to detach if:
        
        * the Volume is in active use on the active Instance to which it is attached.
        * if the Instance to which it is attached is in an inactive state (shelve/shutdown/suspend) (i.e. the Instance must be active in order to detach)

* After the Volume has successfully detached, it may be subsequently re-attached to any of the User's active Instances on the same provider cloud.


!!! note "Detaching Volumes"

    **REMINDER**: Volumes can only be detached if:

    1. they are not in active use by a process on the instance
       Try:
           * `fuser -m /<volume>`  to LIST all processes using a volume
               * You might also try `sudo fuser -m /volume` if nothing comes up – this will check for root processes holding the volume open
           * `fuser -km /<volume>` to KILL all processes using a volume
               * If you get results with sudo above, you'll need to do `sudo fuser -km /<volume>` to kill the processes
    2. the instance to which they are attached is active
           * `sudo lsof /<volume>` will also show you processes using the volume.
