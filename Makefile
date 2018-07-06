DOCKER_IMAGE := gitlab/gitlab-ce

all: build

bash:
	@source .env
	@docker run --rm --net=host -it ${DOCKER_IMAGE}:${GITLAB_CE_VERSION} /bin/sh

reconfigure:
	@docker-compose exec gitlab gitlab-ctl reconfigure

backup:
  @docker-compose exec gitlab gitlab-rake gitlab:backup:create

build:
	@bash scripts/buildEnv.sh
