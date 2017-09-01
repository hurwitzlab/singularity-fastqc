BootStrap: debootstrap
OSVersion: trusty
MirrorURL: http://us.archive.ubuntu.com/ubuntu/


%runscript

%post
    echo "Hello from inside the container"
    sed -i 's/$/ universe/' /etc/apt/sources.list
    
    #essential stuff
    apt -y --force-yes install git sudo man vim build-essential wget unzip
    
    #maybe dont need, add later if do:
    #curl autoconf libtool 
    cd ~
    wget https://sourceforge.net/projects/solexaqa/files/latest/download?source=files
    #put stuff in wget to rename it
    #unzip
    #move executable to /usr/local/bin or whatever

%test
