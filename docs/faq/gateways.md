# Science Gateways and related services FAQ

### How can I federate logins on my gateway or JupyterHub service?

The recommended and supported means for doing so on Jetstream2 is to use the Custos software provided by the [Cyberinfrastructure Integration Research Center](https://circ.iu.edu/){target=_blank}

Information on federating your gateway or Jupyter service is outlined in on [Federating a gateway or JupyterHub on Jetstream2](../general/federating.md) 

---

### How do I set up a custom domain name for my gateway, site, or web service?

If you want to access your site/service with a hostname (rather than a raw public IP address), you will need to set up appropriate DNS (Domain Name Service) records. 

It is possible to configure automatic DNS hostnames for instances in the `projects.jetstream-cloud.org` subdomain; for more information, see ["How do I get a jetstream-cloud.org DNS name for my instance?"](../general-faq/#how-do-i-get-a-jetstream-cloudorg-dns-name-for-my-instance)
{: .note}

Second level "designer" domains like "myresearchproject.org" or "ourcoolproject.info" would need to be purchased from an [ICANN-accredited registrar](https://www.icann.org/en/accredited-registrars){target=_blank}. Many popular registrars will include DNS configuration in the price of a domain. Before purchasing a domain name, consider investigating whether your sponsoring university or organization offers such services; for example, projects affiliated with Indiana University may be able to obtain an [IU subdomain](https://kb.iu.edu/d/aqeo){target=_blank}.

Once you have a domain registered, you will need to set up DNS records to point that domain to the public IP address of your Jetstream2 instance(s). If your service/site is served on the usual ports 80 and 443 for HTTP and HTTPS respectively, this can be accomplished with a simple [A record](https://web.archive.org/web/20230115025823/https://www.cloudflare.com/learning/dns/dns-records/dns-a-record/){target=_blank}; otherwise, you may need to investigate [using SRV records to redirect traffic to a specific port](https://web.archive.org/web/20221126130540/https://www.baeldung.com/cs/redirect-dns){target=_blank}.