
USER = whoami



echo "Initializing and installing GeekBench 3"

cd /home/$USER/Downloads
wget http://logcat.student.rit.edu/Public%20Share/Geekbench-3.2.0-Linux.tar.gz
tar -xzvf Geekbench-3.2.0-Linux.tar.gz
cd dist
mv Geekbench-3.2.0-Linux /home/$USER/Desktop
cd /home/$USER/Desktop
cd Geekbench-3.2.0-Linux


echo "Setup for Geekbench"
sudo apt-get install lib32stdc++6
./geekbench_x86_64 -r $serial_email $serial_number

cd /home/jordan/Desktop/Geekbench-3.2.0
./geekbench_x86_64 --upload 

echo "Geekbench Setup: Run syntax is ./geekbench"
