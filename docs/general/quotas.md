Jetstream2 tries to apportion the memory, storage, and network available to researchers based on both allocation type and Jetstream2 resource node type.

## Limit Types

Quotas are a function of:

### **allocation** type:

| <div style="width:180px">Startup/Research</div> | <div style="width:180px">Education</div> | <div style="width:180px">Jetstream Trial Allocations (JTA)</div> |
| --- | --- | --- |
| default allocations for collaborative users in a common research project. | special allocations for teaching and workshops. Quotas are set slightly higher because of typical larger user counts | Sample allocations with minimal capacity quotas designed for evaluation purposes |

### **resource** type:

| <div style="width:180px">CPU (compute)</div> | <div style="width:180px">GPU | <div style="width:180px">LM (large memory compute)</div> |
| --- | --- | --- |
| normal bulk compute resources with higher available core counts | GPU accelerated resource with additional ceph storage | 2X-memory compute resource with additiona ceph storage|
| 75% of JS2 | 19% of JS2 | 6% of JS2 |
| 3.9  GB per RAM per core | 7.8  GB RAM per core | 3.9  GB RAM per core |


| <div style="width:180px">STARTUP/RESEARCH</div> | <div style="width:180px">defaults<br/>_(can be modified on request)_</div> | <div style="width:180px"></div> |
| --- | --- | --- |
| `CPU` | `GPU` | `LM` |
| 150 cores<br/>585 GB RAM<br/>10 floating IPs| 64 cores<br/>250 GB RAM<br/>4 floating IPs| 128 cores<br/>1000 GB RAM<br/>2 floating IPs|

| <div style="width:180px">EDUCATION</div> | <div style="width:180px">defaults<br/>_(can be modified on request)_</div> | <div style="width:180px"></div> |
| --- | --- | --- |
| `CPU` | `GPU` | `LM` |
| 200 cores<br/>780 GB RAM<br/>25 floating IPs | 320 cores<br/>1250 GB RAM<br/>25 floating IPs | 128 cores<br/>1000 GB RAM<br/>2 floating IPs |

| <div style="width:180px">JTA</div> | <div style="width:180px">defaults<br/>_(CANNOT be modified)_</div> | <div style="width:180px"></div> |
| --- | --- | --- |
| `CPU` | `GPU` | `LM` |
| 2 cores<br/>6  GB RAM<br/>2 floating IPs | none | none |
