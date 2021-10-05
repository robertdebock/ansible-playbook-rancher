# Ansible playbook for Rancher

## Setup

1. Download the Ansible roles:

The state of the used roles:

|Role name|GitHub Action|GitLab CI|Version|
|---------|-------------|---------|-------|
|[bootstrap](https://galaxy.ansible.com/robertdebock/bootstrap)|[![github](https://github.com/robertdebock/ansible-role-bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-bootstrap/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-bootstrap/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-bootstrap)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-bootstrap/latest.svg)](https://github.com/robertdebock/ansible-role-bootstrap/releases)|
|[core_dependencies](https://galaxy.ansible.com/robertdebock/core_dependencies)|[![github](https://github.com/robertdebock/ansible-role-core_dependencies/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-core_dependencies/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-core_dependencies/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-core_dependencies)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-core_dependencies/latest.svg)](https://github.com/robertdebock/ansible-role-core_dependencies/releases)|
|[buildtools](https://galaxy.ansible.com/robertdebock/buildtools)|[![github](https://github.com/robertdebock/ansible-role-buildtools/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-buildtools/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-buildtools/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-buildtools)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-buildtools/latest.svg)](https://github.com/robertdebock/ansible-role-buildtools/releases)|
|[python_pip](https://galaxy.ansible.com/robertdebock/python_pip)|[![github](https://github.com/robertdebock/ansible-role-python_pip/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-python_pip/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-python_pip/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-python_pip)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-python_pip/latest.svg)](https://github.com/robertdebock/ansible-role-python_pip/releases)|
|[docker](https://galaxy.ansible.com/robertdebock/docker)|[![github](https://github.com/robertdebock/ansible-role-docker/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-docker/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-docker/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-docker)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-docker/latest.svg)](https://github.com/robertdebock/ansible-role-docker/releases)|
|[crocron](https://galaxy.ansible.com/robertdebock/cron)|[![github](https://github.com/robertdebock/ansible-role-cron/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-cron/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-cron/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-cron)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-cron/latest.svg)](https://github.com/robertdebock/ansible-role-cron/releases)|
|[hostname](https://galaxy.ansible.com/robertdebock/hostname)|[![github](https://github.com/robertdebock/ansible-role-hostname/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-hostname/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-hostname/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-hostname)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-hostname/latest.svg)](https://github.com/robertdebock/ansible-role-hostname/releases)|
|[ntp](https://galaxy.ansible.com/robertdebock/ntp)|[![github](https://github.com/robertdebock/ansible-role-ntp/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-ntp/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-ntp/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-ntp)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-ntp/latest.svg)](https://github.com/robertdebock/ansible-role-ntp/releases)|
|[grub](https://galaxy.ansible.com/robertdebock/grub)|[![github](https://github.com/robertdebock/ansible-role-grub/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-grub/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-grub/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-grub)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-grub/latest.svg)](https://github.com/robertdebock/ansible-role-grub/releases)|

```shell
ansible-galaxy install -r roles/requirements.yml
```

2. Download the terraform providers and modules:

```shell
cd terraform
terraform init
```

3. Set the DigitalOcean and CloudFlare credentials:

```shell
export TF_VAR_do_token="REPLACE_ME_WITH_THE_DO_TOKEN"
export TF_VAR_cloudflare_api_token="REPLACE_ME_WITH_THE_CF_TOKEN"
```

## Installation

Apply the playbook:
```
./playbook.yml
```

This will:

1. Create the infrastructure using Terraform.
2. Install Docker. (Including all requirements.)
3. Create the `rancher/rancher` container.

Finally, login. (URL displayed at the end of the play.)

### Files

```
.
├── ansible.cfg - To tell Ansible how to work.
├── playbook.yml - The playbook to run.
├── group_vars - Variables used by Ansible.
├── roles - Where roles will be stored.
│   └── requirements.yml - What roles to download.
└── terraform - A description of the infrastrucure.
```
