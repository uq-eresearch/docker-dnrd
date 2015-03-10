# DNRD Docker Image

> [dnrd](http://dnrd.sourceforge.net/) is a proxying nameserver. It forwards DNS queries to the appropriate nameserver, but can also act as the primary nameserver for a subnet behind a firewall.
-- DNRD man page

This image is based on busybox+glibc with a statically-compiled DNRD binary.

To run:

    docker run -d dnrd -s 8.8.8.8
