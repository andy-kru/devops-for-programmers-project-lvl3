### Hexlet tests and linter status:
[![Actions Status](https://github.com/andy-kru/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/andy-kru/devops-for-programmers-project-lvl3/actions)

### Description

Deployment of Redmine application by using Terraform and Ansible playbook.

### Commands

```sh
$ make init # initialize Terraform
$ make plan # show Terraform execution plan
$ make apply # deploy infrastructure by using Terraform and provision with Ansible
```

### Required variables, to be set by secrets

* `do_token` - DigitalOcean token
* `pvt_key` - path to a private key to interact with DigitalOcean droplets
* `datadog_api_key` - DataDog API token
* `datadog_app_key` - DataDog APP key
