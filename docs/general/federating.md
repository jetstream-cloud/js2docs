# Federating a gateway or JupyterHub on Jetstream2

One of Jetstream2's key features is to enable the federating of gateways and JupyterHub services. To accomplish this, we have partnered with the [Cyberinfrastructure Integration Research Center](https://circ.iu.edu/){target=_blank} to provide their Custos software to researchers and educators on Jetstream2. Custos open source software is operated as a service by the [IU PTI](https://pti.iu.edu/){target=_blank} [Cyberinfrastructure Integration Research Center](https://circ.iu.edu/){target=_blank}. Custos and its constituent components (CILogon, Keycloak, and HashiCorp Vault) are all multi-tenanted services, where a tenant is a science gateway, JupyterHub, or similar service.

To request Custos integration with your service, please follow these steps:

1. Tenant Request Phase: 
    * A gateway or JupyterHub administrator requests a Custos tenant - <https://portal.usecustos.org/>
    * IU Custos administrators review the request and interact with the requesting gateway admins.
    * If the tenant request is approved, a tenant is automatically created within each of the dependent CILogon, Keycloak, Vault, user profile, and group services that Custos manages. 
    * Gateway admin can now login to Custos Admin Portal and obtain their OAuth2 credentials.
2. Gateway Integration Phase: 
    * Gateway developers call Custos services as appropriate using the Custos API methods. Custos provides REST interfaces and Software Development Kits (SDKs). This step is already done for JupyterHub, Galaxy, and Airavata Django Portal-based gateways. 
        * PyPI packages are available from <https://pypi.org/project/custos-jupyterhub-authenticator/>
        * Python SDK documentation is available from <https://cwiki.apache.org/confluence/display/CUSTOS/Use+Custos+Python+SDK>
        * REST API documentation is available from <https://cwiki.apache.org/confluence/display/CUSTOS/Use+Custos+REST+Endpoints>
    * Gateway configures the Custos tenant credentials in its configuration file. See <https://cwiki.apache.org/confluence/display/CUSTOS/Custos+Configuration> for additional details.

3. Gateway administrators can optionally make additional configuration choices, such as filtering users based on Identity Providers (institutions) to further limit access.  The Gateway or Hub admin makes these changes in the tenant profile within the Custos Admin Portal.  These configuration choices are described in the Custos Wiki; see <https://cwiki.apache.org/confluence/display/CUSTOS/Custos+User+Filtering>. 

After Step 3, the gateway or JupyterHub is ready to be used. 
