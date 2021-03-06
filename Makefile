SING242 = /usr/local/bin/singularity #2.4.2-dist
SING231 = /home/vagrant/bin/singularity #2.3.1-dist

SINGULARITY = $(SING242)
IMG_NAME = fastqc.img
DEF_NAME = ubuntu.sh
SIZE = 3036

run:
	sudo $(SINGULARITY) run $(IMG_NAME)

clean:
	rm -f $(IMG_NAME)

img:
	sudo $(SINGULARITY) build $(IMG_NAME) $(DEF_NAME) #actually the 2.4.2 way
#	sudo $(SINGULARITY) create --size $(SIZE) $(IMG_NAME)
#	sudo $(SINGULARITY) bootstrap $(IMG_NAME) $(DEF_NAME)

shell:
	sudo $(SINGULARITY) shell $(IMG_NAME)

scp:
	scp $(IMG_NAME) ua-sftp:/rsgrps/bhurwitz/scottdaniel/singularity-images/
