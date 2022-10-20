# Instance Management Actions

For an in-depth explanation of each instance management action, please reference the [general Instance Management Actions article](../../general/instancemgt.md).
{: .note}

In Exosphere, to see available management actions for an instance and choose one if desired, click the "Actions" drop-down menu on the instance details page.

!!! Warning "Deletion is permanent!"
    [Detach all volumes](../storage/#detaching-a-volume) from your instance before deleting it; otherwise, you may risk corrupting your data and/or the volume. Deleting an instance through Exosphere will **permanently** delete all data on the root disk, even for volume-backed instances.

![Exosphere instance actions menu screenshot](../../images/exo-actions-menu.png)