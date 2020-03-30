# mylab
Virtual machines that I use on my laptop


## Capabilities

* Synchronize local folder [`config`](config) to all guests
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


## Directories

| Directory | Description |
|-----------|-------------|
| [`vagrant`](vagrant) | Files to manage VMs using Vagrant |
| [`config`](config)   | Configuration files used by all VMs |
