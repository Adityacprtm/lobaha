# lobaha
Load Balancing HAproxy Ubuntu 14.04 (trusty64) via Vagrant

## Requirement
- Vagrant
- VirtualBox

## Specification
### OS
- Ubuntu 14.04
### Installed
- HAProxy
- curl
- Aache Web Server
- PHP5

## Installation
Clone this repository

`$ git clone https://github.com/Adityacprtm/lobaha.git`

Move to lobaha deirectory

`$ cd lobaha`

Edit **numNodes** to determine how many nodes (1 node for load balancer) on **Vagrantfile**

Wake up the Vagrant

`$ vagrant up`

## Testing

Now we will use curl and request this file multiple times with IP load balancer

```
> curl http://10.10.10.10/test.php

Server IP: 192.168.56.11
Client IP: 192.168.56.255
X-Forwarded-for: 117.213.X.X

> curl http://10.10.10.10/test.php

Server IP: 192.168.56.12
Client IP: 192.168.56.255
X-Forwarded-for: 117.213.X.X

> curl http://10.10.10.10/test.php

Server IP: 192.168.56.11
Client IP: 192.168.56.255
X-Forwarded-for: 117.213.X.X
```
