JSHINT=./node_modules/jshint/bin/jshint
JSHINTFLAGS=

js_files=$(shell find src -name '*.js')
jshint: $(js_files)
	$(JSHINT) $(JSHINTFLAGS) $?
# .PHONY just tells make that these rules don't produce files. So if there is a
# file called "jshint", it won't interpret that file as the output of the
# jshint recipe.
.PHONY: jshint

watch:
	watchman watch $(shell pwd)/src
	watchman -- trigger $(shell pwd)/src remake *.js *.css -- make jshint
