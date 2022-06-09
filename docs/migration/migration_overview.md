# Migrating to Jetstream2 from Jetstream1

Jetstream 2 will support and encourages the migration of research from Jetstream1 (JS1) to the superior capabilities of Jetstream2 (JS2).
In this section, we document information relative to that migration.

## Jetstream 1 & 2 availability

Jetstream1 will remain online through the end of July 2022. We are no longer accepting any new allocations on Jetstream1 as Jetstream2 has entered operations phase.

!!! warning ""

    There will be no extension beyond July 31 for Jetstream1. All allocations will be disabled and denied access at that time.

We strongly recommend users migrate to JS2 as soon as possible. VMs on JS1 will continue running as long as you have a valid allocation there BUT only until it is decommissioned. The TACC cloud of JS1 will likely be taken down in stages **prior** to the IU cloud.

## What Researchers should know before migrating

Researchers on JS1 wishing to migrate to JS2 should take note of:

1. [Critical differences between JS2 and JS1](#CriticalDifferences) for:
    * [Architecture](#Architecture)
    * [User interfaces](#UI)
    * [Authentication](#ApplicationCredentials)
    * [Software Collection](#SoftwareCollection) </br><br>

2. [How to migrate from JS1 to JS2](migration_overview.md)
    * [Allocations](/migration/how_to_migrate/#Allocations)
    * [How to move data](/migration/how_to_migrate/#MoveData)
    * [Where to find help](/migration/how_to_migrate/#GetHelp)

## Critical differences JS2 and JS1 <a name="CriticalDifferences"></a>

### Architecture <a name="Architecture"></a>

We highly recommend that you read about the [key differences between the architecture of JS2 and JS1](/overview/keydiff/#key-differences-between-jetstream1-and-jetstream2).

The biggest difference is that Jetstream2 will consist of one primary cloud (hosted at Indiana University) and multiple regional clouds, each with unique features and resources.

For Atmosphere users, you will be pleased to find that IP addresses are [persistent](/overview/network/#PersistentIP), though we do ask you to return IP addresses to the pool whenever they are no longer needed, as they are a finite resource.

!!! warning ""

    The JS1 IP pool and IP addresses ARE NOT transferable to JS2 at this time.

### User Interfaces (UI)<a name="UI"></a>

* Jetstream2 has 3 Graphical User Interfaces and a Command Line Interface (CLI).
* User Interfaces will feel familiar, particularly if you’ve tried the API side of JS1 before as we continue to have Exosphere, Horizon, and a Command Line Interface
* For our Atmosphere users, we are recommending Exosphere as it gives much of the power of Horizon while maintaining the simplicity of Atmosphere.

    * [Exosphere: https://docs.jetstream-cloud.org/ui/exo/exo/](/ui/exo/exo)
    * [Horizon : https://docs.jetstream-cloud.org/ui/horizon/intro/](/ui/horizon/intro)
    * [CLI : https://docs.jetstream-cloud.org/ui/cli/overview/](/ui/cli/overview)
    * [Cacao (aka Atmsophere2) : https://docs.jetstream-cloud.org/ui/cacao/overview/](/ui/cacao/overview) </br> ***Note: Cacao is still in development on JS2 and not in its final production state.***


### Application Credentials<a name="ApplicationCredentials"></a>
One important differences to note for our existing users is that we’ve enhanced our security profile and are using **Application Credentials** for our interfaces. Each user interface above has similar, but slightly different ways to access those **Application Credentials**, so please be aware, and carefully follow the instructions.

!!! note "Important note for CLI users"

    Jetstream2 use of **Application Credentials** has expanded to include CLI access. This means CLI users well also authenticate using XSEDE credentials. Please see [Setting up the openrc.sh for the Jetstream2 CLI](/ui/cli/openrc){target=_blank} for instructions generating application credentials and an openrc for Jetstream2.


### Jetstream2 Software Collection<a name="SoftwareCollection"></a>
Rather than pack each and every virtual machine with research software, Jetstream2 has created a shared directory of packages that you can load and unload as desired using the **LMOD** system.

The use of the JS2 Software Collection is described here:</br>
[https://docs.jetstream-cloud.org/general/usingsoftware/#using-the-jetstream2-software-collection](/general/usingsoftware/#using-the-jetstream2-software-collection)
