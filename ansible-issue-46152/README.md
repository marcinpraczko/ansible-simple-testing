# Simple testing Ansible Grafana module

This small project has been created to help with testing grafana module.
At this moment this aims test to latest versions of grafana.

**IMPORTANT:**

- This project is using docker/grafana which seems be mentioned on grafana page:

  - http://docs.grafana.org/installation/docker/

- This project is using fork of source of ansible (related with Ansible GitHub Issue): 

  - https://github.com/jorijinnall/ansible-1.git

- Some systems requires run docker with sudo, please be sure to review all commands:

# Commands to run

This project is having ``Makefile`` which should help test project.
Running ``make`` without any arguments will display help (no action will be done).

```text
usage: make [target] ...

Targets:
========
help              HELP    Show this help message.
enable_sudo       INIT    Enable sudo for all docker commands (some systems required this)
disable_sudo      INIT    Dispable sudo for all docker commands (some systems required this)
clean             CLEAN   Clean workspace - remove all temporary files / folders / etc.
init              TEST    Initial configuration  - run grafana services (different versions)
test              TEST    Test01 - Import grafana dashboard via ansible with fix.
done              TEST    Finish testing - stop all services
version           INFO    Dump details about versions to local file
```


# Quick test

This steps should help quickly run test.

```bash
# Optional: make enable_sudo
make init
make test
make done
```
