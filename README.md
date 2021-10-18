# Ansible playbook for Rancher

## Setup

1. Download the Ansible roles:

The state of the used roles:

|Role name|GitHub Action|GitLab CI|Version|
|---------|-------------|---------|-------|
|[bootstrap](https://galaxy.ansible.com/robertdebock/bootstrap)|[![github](https://github.com/robertdebock/ansible-role-bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-bootstrap/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-bootstrap/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-bootstrap)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-bootstrap/latest.svg)](https://github.com/robertdebock/ansible-role-bootstrap/releases)|
|[ntp](https://galaxy.ansible.com/robertdebock/ntp)|[![github](https://github.com/robertdebock/ansible-role-ntp/workflows/Ansible%20Molecule/badge.svg)](https://github.com/robertdebock/ansible-role-ntp/actions)|[![gitlab](https://gitlab.com/robertdebock/ansible-role-ntp/badges/master/pipeline.svg)](https://gitlab.com/robertdebock/ansible-role-ntp)|[![version](https://img.shields.io/github/commits-since/robertdebock/ansible-role-ntp/latest.svg)](https://github.com/robertdebock/ansible-role-ntp/releases)|

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

NOTE: Currently broken with an intent to move the required steps to `user_data` in Terraform.

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
