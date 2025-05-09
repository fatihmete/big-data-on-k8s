# Big Data on Kubernetes

## About This Document
This documentation is a collection of notes I compiled while learning to deploy big data services on Kubernetes.

## Big Data Services
There are numerous big data tools available, but I selected one for each type of workload. For example, for a SQL engine, I chose Trino, and for a table catalog, I selected Apache Hive. My goal was to focus on widely used services. The targeted services covered in this documentation are listed below:

- **Kubernetes** (RKE2) / Custom Docker Registry
- **HDFS** (Storage)
- **Apache Hive 4** (Metastore/Catalog)
- **Apache Ranger** (Trino, HDFS, Spark and Hive Policy Management/Audit) 
- **Trino** (SQL Engine)
- **Hue** (Web-Based SQL Editor)
- **Spark Notebook - Jupyter Hub / Enterprise Gateway** (Notebook)
- **Iceberg** (Table Format)
- **Kerberos** and **LDAP** Integration

The following services are used in the documentation but are not covered in detail:

- **Kerberos/LDAP Server**: Refer to [this guide](https://oleg-dubetcky.medium.com/ldap-and-kerberos-domain-services-step-by-step-1a0d3e64c532) and [this documentation](https://ubuntu.com/server/docs/how-to-set-up-kerberos-with-openldap-backend) for setup instructions.
- **PostgreSQL Database Server**: Backend database for services like Ranger, Hive, and Hue. It is assumed that the database server is hosted outside the Kubernetes cluster.
- **Solr**: Used only for Ranger audit logs. [GitHub Repository](https://github.com/fatihmete/big-data-on-k8s/tree/main/solr)
- **Longhorn Storage**: [Installation Guide](https://longhorn.io/docs/1.7.2/deploy/install/install-with-helm/)

## Environment
Initially, I experimented with tools like KIND and Minikube. However, I found these tools more suitable for quick tests or single-service development rather than a full-stack big data environment. A full-stack setup requires extensive configuration for networking, storage, and container deployment. As a result, I opted to use virtual machines, which also provide a more realistic, production-like experience.

The virtual machines and host system used for this setup are as follows:

- **Host**: Desktop PC with 12 CPUs, 48GB RAM, and 2x480GB SATA SSDs running Arch Linux.
- **Virtual Machines**:
  - 1 x Kubernetes Master (Rocky Linux 9.5): 4 CPUs, 6GB RAM, 60GB Disk
  - 4 x Kubernetes Workers (Rocky Linux 9.5): 4 CPUs, 6GB RAM, 60GB Disk each
  - 1 x LDAP/KDC Server (Ubuntu Server 24.04): 2 CPUs, 2GB RAM, 20GB Disk
  - 1 x PostgreSQL Server (Rocky Linux 9.5): 2 CPUs, 2GB RAM, 20GB Disk

For virtualization, I used the **libvirt** and **QEMU** stack.

Although Kubernetes installation is not the primary focus of this documentation, I included a section on it for completeness. Rancher tools (e.g., RKE2, Rancher UI) simplify the process and provide a robust Kubernetes environment.

## Limitations
I am still in the process of learning the services covered in this documentation. Therefore, the content may not be production-ready or fully optimized.

In most cases, I used NodePort services to expose applications outside the Kubernetes cluster. However, for production environments, you should consider using Ingress controllers, LoadBalancers, or high-availability tools such as HAProxy, Keepalived, MetalLB, or kube-vip.

For persistent storage, I primarily used `hostPath` to keep the Kubernetes environment minimal. In production, you should consider using a CSI driver for persistent storage, such as `Longhorn`, `rook.io`, or `vSphere`.