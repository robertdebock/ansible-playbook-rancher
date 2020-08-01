# Ansible playbook for Rancher

## Setup

Non required, all files are in this repository.

## Starting it.

First, start the machine:

```shell
vagrant up
```

Next, apply the playbok:
```
ansible-playbook playbook.yml
```

Finally, login. (URL displayed at the end of the play."

### Files

```
.
├── ansible.cfg - To tell Ansible how to work.
├── inventory
│   └── vagant.py - To "see" the nodes from Vagrant.
├── playbook.yml - The playbook to run.
├── roles - Where roles will be stored.
│   └── requirements.yml - What roles to download.
└── Vagrantfile - The machines to start.
```
