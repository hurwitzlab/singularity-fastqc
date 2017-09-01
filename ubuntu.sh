BootStrap: debootstrap
OSVersion: trusty
MirrorURL: http://us.archive.ubuntu.com/ubuntu/


%runscript
    echo "By default this runs solexaqa, use singularity exec to run fastqc"
    exec /usr/bin/solexaqa "$@"

%post
    echo "Hello from inside the container"
    sed -i 's/$/ universe/' /etc/apt/sources.list
    
    #essential stuff
    apt -y --force-yes install git sudo man vim build-essential wget unzip \
        default-jre
    
    #maybe dont need, add later if do:
    #curl autoconf libtool 
    cd ~
    wget https://sourceforge.net/projects/solexaqa/files/latest/download?source=files -O solexa.zip
    unzip solexa.zip
    mv Linux_x64/SolexaQA++ /usr/bin/solexaqa
    rm -rf *

    wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip -O fastqc.zip
    sudo unzip fastqc.zip
    sudo chmod +x FastQC/fastqc
    sudo mv FastQC/fastqc /usr/bin
    rm -rf *

%test
    solexaqa -h
    fastqc --help
