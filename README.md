cent
===============

Scripts for use with new centOS installs. Currently built for the currently implemented SuperMicro i686 server units.
All scripts currently invoke via Yum



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

Jordan Westhoff, RIT 2014

