.PHONY: all
all: build doczip

.PHONY: clean
clean:
	-rm -rf *.o *.class a.out mywc doc.tar.gz html/ latex/

.PHONY: build
build: mywc

.PHONY: doc
doc: html/index.html

.PHONY: doczip
doczip: doc.tar.gz

mywc: wc.c
	gcc -o mywc wc.c

html/index.html: wc.c
	doxygen doxygen.cfg

doc.tar.gz: doc
	tar -czf doc.tar.gz html/ latex/
