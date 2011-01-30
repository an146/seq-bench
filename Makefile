# TESTS=c_heap ocaml_heap ocaml_set ocaml_fheap
TESTS=seqbench

.PHONY: all clean
all : ${TESTS}
	@./test.sh

clean:
	rm -Rf ${TESTS} *.{cmi,cmx,o}

%: %.ml
	ocamlfind ocamlopt -package batteries -linkpkg -o $@ $^
