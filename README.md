# THIS IS NOT THE ENVIRONMENT FOR OPEN SOURCE IC DESIGN TOOLS (IIC-OSIC-TOOLS)!
Please see [IIC-OSIC-TOOLS](https://github.com/iic-jku/iic-osic-tools) for a complete set of free and open source IC design tools.
# eda_docker
A Docker Container based one CentOS 7 to run commercial EDA applications, that require a legacy OS environment.
This Container does not and will never include any commercial applications but a environment to run applications that require a specific operating system version to work properly. It is hand-tuned for our internal needs.

## Features
* Opens a (xfce4-)terminal, using the hosts X-Server (by mapping the local sockets to the X-Server, and copying over the authentication to the container)
* Map the hosts user ID and group IDs to the container
* Fakes `uname` to mask the hosts real kernel (based on [borting/fakeuname](https://github.com/borting/fakeuname))
* Includes a set of libraries to make the well-known commercial EDA tools (in different recent versions) work.
* `/home` is mounted from the host, to access all required user files.
* `/eda` is the directory that holds the tools. Must be mounted accordingly (the start_x.sh expects this to also be /eda on the host).
* Same for `/sim` and `/sim_nfs`. Those two directories should also be mounted to host directories, whereas sim is meant for a quick local sim-result storage, sim_nfs for a slower but larger storage (e.g.: a huge NFS drive).
