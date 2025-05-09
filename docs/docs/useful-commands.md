# Useful Commands

## Kerberos

### kinit

```bash
kinit -kt <keytab> <principal>

```
Example:
```bash
kinit -kt /etc/security/keytab/namenode.keytab hdfs/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG
```
### klist
Show current user kerberos ticket:
```bash
klist
```
Show existing kerberos keytab details:
```bash
klist -kte <keytab>
```
### ktutil
Creating new keytab:
```bash
ktutil
add_entry -password -p hdfs/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG -k 1 -e aes128-cts-hmac-sha1-96
add_entry -password -p hdfs/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG -k 1 -e aes256-cts-hmac-sha1-96
add_entry -password -p hdfs/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG -k 1 -e aes128-cts-hmac-sha256-128
add_entry -password -p host/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG -k 1 -e aes128-cts-hmac-sha1-96
add_entry -password -p host/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG -k 1 -e aes256-cts-hmac-sha1-96
add_entry -password -p host/namenode.company.bigdata.svc.cluster.local@HOMELDAP.ORG -k 1 -e aes128-cts-hmac-sha256-128
wkt ./files/namenode.keytab
```

## Kubernetes

### Containerd prune unused images
```bash
export CRI_CONFIG_FILE=/var/lib/rancher/rke2/agent/etc/crictl.yaml
/var/lib/rancher/rke2/bin/crictl rmi --prune
```

## Linux

### Disable SELINUX
```bash
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config && sudo setenforce 
```
### Disable firewalld
```bash
systemctl disable --now firewalld
```
### Set systemd timeout
```bash
sed -i '/^#DefaultTimeoutStopSec=/c\DefaultTimeoutStopSec=10s' /etc/systemd/system.conf /etc/systemd/user.conf && sudo systemctl daemon-reexec
```
### Longhorn Packages
```bash
dnf install nfs-utils iscsi-initiator-utils cryptsetup device-mapper
```

### Extend root path size without restart(/dev/vda2)
```bash
qemu-img resize disk.qcow2 +10G
```
```bash
parted /dev/vda
resizepart 2 100%
```
```bash
pvresize /dev/vda2
lvdisplay
lvextend -r -l +100%FREE /dev/mapper/rl-root
lsblk
```