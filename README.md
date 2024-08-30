# NetBash ![Static Badge](https://img.shields.io/badge/build-Version%201.2-brightgreen?logo=gnubash&logoColor=white&color=blue)
Netbash is an automated bash tool that will help the user to enumerate systems, where you can do Host Discovery, Port Scanning and much more!!

# Usage
When you run the tool you can see the following:

![](img/1.png)

You have two functional parameters, the only functional tool is **Netscan**.

## NetScan (Tested in ![Static Badge](https://img.shields.io/badge/build-6.8.11%20amd64-brightgreen?logo=kalilinux&logoColor=white&label=Kali%20Linux&color=blue)) ![Static Badge](https://img.shields.io/badge/Docker-Ubuntu%2024.04-brightgreen?logo=docker&logoColor=white&color=blue)

If we start netscan as a non-privileged user, it will ask us to be a privileged user:

![](img/2.png)

We will be able to see 6 options, I will show all of them:

![](img/3.png)

### Simple scan

Selecting the first one will ask for the IP of the target:

![](img/4.png)

And it will perform a basic nmap scan but with some parameter optimizations that come with nmap:

![](img/5.png)
