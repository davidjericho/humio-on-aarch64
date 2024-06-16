# Rebuild of the Official Humio OCI Container to run on AARCH64

This build presently won't work due to changes in various upstream sources. I might get to it later to fix it.

## About

Humio is now known as CrowdStrike Falcon® LogScale. This container pulls the official humio/humio OCI container from DockerHub and recreates the environment used to then run this on aarch64. Nothing within this repository is CrowdStrike IP or created by them, and this work is a (bad) reverse engineering of the official container image.

Don't reach out to CrowdStrike for support on this. This is purely an experiment in comparing architectures for efficiency and throughput, and just how low a machine I can get this to run on.

I created this Dockerfile based on what I gleaned using alpine/dfimage and wagoodman/dive.

If you want to find out more, visit https://www.crowdstrike.com/products/observability/falcon-logscale/

Read the Docker install documentation at https://library.humio.com/humio-server/installation-containers-docker.html

## containerd and nerdctl

At present the Humio container does certain tasks as root. My experience is that it does not need to run this way, but it does create some awkwardness when building the container using rootless nerdctl. I've added nerdctl make option to simply elevate to root to build it.
