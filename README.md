# Travis CI ROOT builds

Scripts to build [ROOT](http://root.cern.ch/) distributions for use on
[Travis CI](https://travis-ci.org/), adapted for Ubuntu 14.04 and building
inside a docker container.

## Motivation

If your project relies on ROOT to run its tests, and you would like to run them
on Travis CI, you need a way to install ROOT. However, Travis CI virtual
machines, on which the tests run, have a limited lifetime, often too short to
compile ROOT from source, and so an alternative method is needed.

## Building the distributions

To use the ROOT distributions in your Travis CI tests, see the [Usage](#usage)
section.

[Vagrant](http://www.vagrantup.com/) and
[VirtualBox](https://www.virtualbox.org/) (or [Docker](https://www.docker.com/))
are required to build the ROOT distributions supported by the repository.
These are used to run a [Ubuntu](http://www.ubuntu.com/) 14.04 LTS Server
Edition 64 bit distribution, the
[same OS](http://docs.travis-ci.com/user/ci-environment/#CI-environment-OS)
used on the Travis CI VMs.

To set up the VM, clone this repository and provision.

```bash
% git clone https://github.com/alexpearce/travis-ci-root-builds.git
% cd travis-ci-root-builds
% vagrant up --provider=docker
% vagrant docker-exec -it -- /vagrant/provisioning.sh
```

To build the ROOT distributions, source the build script inside the container

```bash
% vagrant docker-exec -it -- /vagrant/build
```

Each build can take a significant amount of time, upwards of 30 minutes.

A tarball for each build will be created in the `/vagrant/builds/` folder,
which in a standard Vagrant install is shared with the host machine.

The ROOT and python versions to perform a build for can be set in
[`tags.lst`](tags.lst) and [`build`](build#L27), respectively.
Python versions other than 2.7 and 3.4 will also require adjustments to the
[provision](provisioning.sh) script.

## Usage

To use the builds in your tests, you need to add a few lines to the
`.travis.yml` configuration file in the repository you want to test.

See the
[`rootpy`](https://github.com/rootpy/rootpy)
repository and its
[`.travis.yml`](https://github.com/rootpy/rootpy/blob/master/.travis.yml)
for an example.
