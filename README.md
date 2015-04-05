cent
===============

Scripts for use with new centOS installs. Currently built for the currently implemented SuperMicro i686 server units.
All scripts currently invoke via Yum

-----------------------------------------------
### oaks_backup & oaks_backup_dphoto
        -> Deprecated scripts for reference to backup a client set of software backups

------------------------------------------------
### chromium_install.sh
        -> Generic kickstart program to fetch and install the correct i686 RPM
           for Chromium (open source version of Google Chrome for linux distros)


------------------------------------------------
### disk_speed.sh
        -> Generic disk speed test utility.
           Writes a 2GB (by default) file to disk and measures the time required.
           Utility then reads the same chunk of data and times as well.
           When the utility is done, the data is removed.

------------------------------------------------
### disk_speedVAR.sh
        -> Performs the same functionality as disk_speed.sh but allows for variable
           input (in MB) for custom sized disk speed testing.
------------------------------------------------
### LAMP_install.sh
        -> This is a comprehensive install for LAMP
           { - Linux
             - Apache
             - mySQL
             - and PHP
           }

           The scripts also manages dependancies and all versioning required.

------------------------------------------------
### vagrant_setup.sh
        -> Comprehensive VagrantUP setup utility.
           This included tackling all of the necessary dependencies as well.
           { - VNCserver
             - TigerVNC
             - VirtualBox
             - VagrantUP
           }

           The setup also includes the clauses to invoke the four most popular
           linux distros to be used currently
           { - centOS 6.5 x64_86
             - centOS 6.5 i686
             - Ubuntu 12.04 LTS Precise Pangolin 64-Bit

             _ Ubuntu 12.04 LTS Precise Pangolin 32-Bit
           }


-------------------------------------------------
## VMs
- Folder for Virtual Machine Provision scripts
- Tooled to allow for both VirtualBox and VMWare Workstation VM's



Jordan Westhoff, RIT 2014

