# Migrating to Jetstream2 from Jetstream1

Researchers on Jetstream1 (JS1)  wishing to migrate to Jetstream2 (JS2) should take note of:

1. [Critical differences between JS2 and JS1](#CriticalDifferences) for:
    * [Architecture](#Architecture)
    * [User interfaces](#UI)
    * [Authentication](#ApplicationCredentials)
    * [Software Collection](#SoftwareCollection) </br>

2. [How to migrate from JS1 to JS2](migration_overview.md)
    * [Allocations](how_to_migrate.md/#Allocations)
    * [How to move data](how_to_migrate.md/#MoveData)
    * [Where to find help](how_to_migrate.md/#GetHelp)

## Critical differences JS2 and JS1 <a name="CriticalDifferences"></a>

### Architecture <a name="Architecture"></a>

The key differences between the architecture of JS2 and JS1 are described here:</br>
[https://docs.jetstream-cloud.org/overview/keydiff/#key-differences-between-jetstream1-and-jetstream2](overview/keydiff/#key-differences-between-jetstream1-and-jetstream2)

The biggest difference is that Jetstream2 will consist of one primary cloud (hosted at Indiana University) and multiple regional clouds.

### User Interfaces (UI)<a name="UI"></a>

* User Interfaces will feel familiar, particularly if you’ve tried the API side of JS1 before as we continue to have HORIZON, EXOSPHERE, and a COMMAND LINE INTERFACE.
* For our Atmosphere users, both EXOSPHERE and the successor to Atmosphere: CACAO offer the ease-of-use you’ve come to expect.
* Jetstream2 has 3 Graphical User Interfaces and a Command Line Interface (CLI).

    * [EXOSPHERE: https://docs.jetstream-cloud.org/ui/exo/exo/](ui/exo/exo)
    * [CACAO (aka Atmsophere2) : https://docs.jetstream-cloud.org/ui/cacao/overview/](ui/exo/exo)
    * [HORIZON : https://docs.jetstream-cloud.org/ui/horizon/intro/](ui/exo/exo)
    * [CLI : https://docs.jetstream-cloud.org/ui/cli/overview/](ui/exo/exo)


### Application Credentials<a name="ApplicationCredentials"></a>
One important differences to note for our existing users is that we’ve enhanced our security profile and are using **Application Credentials** for our interfaces. Each user interface above has similar, but slightly different ways to access those **Application Credentials**, so please be aware, and carefully follow the instructions.

### Jetstream2 Software Collection<a name="SoftwareCollection"></a>
Rather than pack each and every virtual machine with research software, Jetstream2 has created a shared directory of packages that you can load and unload as desired using the **LMOD** system.

The use of the JS2 Software Collection is described here:</br>
[https://docs.jetstream-cloud.org/general/usingsoftware/#using-the-jetstream2-software-collection](general/usingsoftware/#using-the-jetstream2-software-collection)

