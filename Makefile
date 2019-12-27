VERSION=$(shell date '+%Y.%m.%d')
RELDIST=$(HOME)/dist

all: build gittag rel

build:
	./wrap.sh

ver:
	echo $(IMAGE) version $(VERSION)

gittag:
	git tag v$(VERSION)
	git push --tags origin master

draft:
	ghr -draft v$(VERSION) $(RELDIST)

rel:
	ghr v$(VERSION) $(RELDIST)
