Passing Makefile argument to sub Make:

If the argument is an environment variable, just need to modify the argument in the current Makfile, no need to pass as argument. E.g.:

  `Makefile`:
  
    HOME := kerker  
    all:  
      ${MAKE} -C src
  
  `src/Makefile`:
  
    all:
      @echo ${HOME}
  

Typing `make` should return `kerker` intead of real `$HOME`.

However if the argument is not an environment variable, need to pass as argument. E.g.:

  `Makefile`:
  
    KERKER := kerker
    all:
      ${MAKE} -C src
    test:
      ${MAKE} -C src KERKER=${KERKER}
  
  `src/Makefile`:
  
    all:
      @echo ${KERKER}
  
`make` won't echo `kerker`, `make test` will.
