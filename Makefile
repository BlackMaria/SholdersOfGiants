NAME = gpg2qr
EPOCH=$(shell date +%s )

docker: 
	docker build -t ${NAME}:${EPOCH} .
	@docker rmi ${NAME}:latest  >& /dev/null || echo ${NAME}:latest created
	docker tag ${NAME}:${EPOCH} ${NAME}:latest
	touch docker

clean:
	rm -f docker


test: docker
	docker run --privileged --name haveged -d harbur/haveged || echo already running
	docker run --rm --name gpg  -it -v /dev/urandom:/dev/random -v ~/.gnupg:/root/.gnupg ${NAME}:latest gpg2qrcode.sh ${GPG_KEY}


debug:
	docker run --rm --name gpg  -it -v /dev/urandom:/dev/random -v ~/.gnupg:/root/.gnupg ${NAME}:latest bash