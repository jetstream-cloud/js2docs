#Configuration and specifications

### Primary Cloud Specifications

#### Compute Nodes (384 nodes)

| System Configuration        | Aggregate information           | Per Node (Compute Node)  |
|:-------------|:-------------:|:-----:|
| Machine type | Dell | Dell PowerEdge C6525 |
| Operating system      | Ubuntu      |   Ubuntu |
| Processor cores | 49,152      |    128  |
| CPUs  | 768 (AMD Milan 7713) | 2  |
| RAM   | 192 TiB  | 512 GiB |
| Network   | 100 Gbps x 4 to Internet2  | 100 Gpbs to switch  |
| Storage  | 14 PB Total Ceph Storage  | 240gb SSD  |

#### Large Memory Nodes (32 nodes)

| System Configuration        | Aggregate information           | Per Node (Large Memory Node)  |
|:-------------|:-------------:|:-----:|
| Machine type | Dell | Dell PowerEdge R7525 |
| Operating system      | Ubuntu      |   Ubuntu |
| Processor cores | 4,096      |    128  |
| CPUs  | 64 (AMD Milan 7713) | 2  |
| RAM   | 32 TiB  | 1024 GiB  |
| Network   | 100 Gbps x 4 to Internet2  | 100 Gpbs to switch  |
| Storage  | 14 PB Total Ceph Storage  | 480gb SSD  |

#### GPU Nodes (90 nodes)

| System Configuration        | Aggregate information           | Per Node (GPU Node)  |
|:-------------|:-------------:|:-----:|
| Machine type | Dell | Dell PowerEdge XE8545 |
| Operating system      | Ubuntu      |   Ubuntu |
| Processor cores | 11,520      |    128  |
| CPUs  | 180 (AMD Milan 7713) | 2  |
| RAM   | 45 TiB  | 512 GiB |
| GPUs   | 360 (NVIDIA A100 SXM4 40GB)  | 4 |
| Network   | 100 Gbps x 4 to Internet2  | 100 Gpbs to switch  |
| Storage  | 14 PB Total Ceph Storage  | 960gb SSD  |
