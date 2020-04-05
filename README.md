# mylab
Virtual machines that I use on my laptop


## Capabilities

* Synchronize local folder [`config`](config) to all guests
* Synchronize local folder [`software`](software) to node `origin`
* Enable root ssh between all guests by configuring same ssh key for root


## Vagrant

VMs are provisioned by Vagrant and VirtualBox.
The Vagrant configuration is stored in directory [`vagrant`](vagrant).

To boot all VMs just do:
```
cd vagrant
vagrant up
```

### Vagrantfile

The [`Vagrantfile`](vagrant/Vagrantfile) just launches one VM running CentOS8.

#### Variables

| Variable | Description |
|----------|-------------|
| mynodes  | Dictionary of VMs to be managed by Vagrant. |

##### VM properties

VMs can be customized be settings the following properties in `mynodes`:

| Property | Description |
|----------|-------------|
| ip       | Static IP address an internal cluster network |
| disks    | List of disks. See file [nodes.yml.smp](config/nodes.yml.smp) for supported properties |  


## Directories

| Directory | Description |
|-----------|-------------|
| [`vagrant`](vagrant) | Files to manage VMs using Vagrant |
| [`config`](config)   | Configuration files used by all VMs |
| [`software`](software)   | Software packages replicated to node `origin` |
| [`disks`](disks)     | Disk images for VMs created by Vagrant |


## Provisioning

Virtual Machines will be provisioned with the plain operating system which is
pinned in the [`Vagrantfile`](vagrant/Vagrantfile) and customized as specified
in the node configuration file ([nodes.xml](config/nodes.xml.smp)).

It is recommended to do further configuration of the operating system with
Ansible.
The node `origin` is the Ansible control node for the whole `mylab`
environment.

There is a node specific hook for configuration steps to be performed by
Vagrant:
Vagrant will execute the script (`provision_<nodename>.sh`), if it exists in
the directory [`config`](config).


### Node `Origin`

Node `Origin` is the control station for the whole `mylab` environment.
It keeps the Ansible playbooks and configuration to configure the operating
system and the applications on all other nodes.

Node `Origin` will be customized by node provision script
[`provision_origin.sh`](config/provision_origin.sh) which installs Ansible
and Git and clones this project to `/root/mylab`.
