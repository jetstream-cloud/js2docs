![cacao logo](images/cacao-logo.png){ width=128px }[Cacao Overview](overview.md) &gg; Cacao Glossary

# Cacao Glossary

This glossary defines common terms you might see in Cacao

[A](#A_) | B | [C](#C) | [D](#d) | E | F | G | H | [I](#I) | J | K | L | [M](#M) | N | O | [P](#P) | Q | [R](#R) | S | [T](#T) | U | V | [W](#W) | Z | W | Z

### <a name="A"></a>A

**Application credential**<br/>
An application credential, specifically an [Openstack application credential](https://docs.openstack.org/keystone/xena/user/application_credentials.html), is a credential that allows a user to login to an Openstack cloud without the user's password.

### <a name="C"></a>C

**Continuous analysis**<br/>
Continuous analysis is the ability to execute workflows triggered by events, such as data changes or code changes

### <a name="D"></a>D

**Deployment**<br/>
A deployment is a collection of one or more resources, such as instances and storage, created in a cloud.

### <a name="I"></a>I

**Instance**<br/>
An instance is another name for a virtual machine or server (in Openstack)

### <a name="P"></a>P

**Provider**<br/>
A provider is another name for cloud or cloud provider, where cloud resources are created

### <a name="R"></a>R

**Resource**<br/>
A resource or cloud resource is a general term used for any object -- instance, volume, container -- in a cloud

### <a name="T"></a>T

**Template**<br/>
A template refers to a set of instructions or a description of what cloud resources to create in a cloud. A template in CACAO requires a template engine to process these instructions. Currently, CACAO only support Hashicorp Terraform templates, including any embedded scripts or code that is supported through Terraform's [local-exec provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec), such as Ansible.

### <a name="W"></a>W

**Workspace**<br/>
A workspace is a way to group one or more deployments.