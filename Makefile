.PHONY: help
help:
	@ echo "build"
	@ echo "run"


pkg/foundationdb-clients-5.1.5-1.el6.x86_64.rpm:
	@ wget -P pkg https://www.foundationdb.org/downloads/5.1.5/rhel6/installers/foundationdb-clients-5.1.5-1.el6.x86_64.rpm


pkg/foundationdb-server-5.1.5-1.el6.x86_64.rpm:
	@ wget -P pkg https://www.foundationdb.org/downloads/5.1.5/rhel6/installers/foundationdb-server-5.1.5-1.el6.x86_64.rpm

pkg: pkg/foundationdb-clients-5.1.5-1.el6.x86_64.rpm pkg/foundationdb-server-5.1.5-1.el6.x86_64.rpm


.PHONY: build
build: pkg
	@ docker build -t "igor-kupczynski/foundationdb:5.1.5-1" .


.PHONY: run
run:
	docker run --rm -P -it igor-kupczynski/foundationdb:5.1.5-1
