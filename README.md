# Rebuild of the Official Humio OCI Container to run on AARCH64

Humio is now known as CrowdStrike Falcon® LogScale. This container pulls the official humio/humio OCI container from DockerHub and recreates the environment used to then run this on aarch64. Nothing within this repository is CrowdStrike IP or created by them, and this work is a (bad) reverse engineering of the official container image.

Don't reach out to CrowdStrike for support on this. This is purely an experiment in comparing architectures for efficiency and throughput, and just how low a machine I can get this to run on.

I created this Dockerfile based on what I gleaned using alpine/dfimage and wagoodman/dive.

If you want to find out more, visit https://www.crowdstrike.com/products/observability/falcon-logscale/

Read the Docker install documentation at https://library.humio.com/humio-server/installation-containers-docker.html
