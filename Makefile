REBAR=$(shell pwd)/rebar
all: compile

compile:
	@$(REBAR) compile

clean: clean-docs
	@$(REBAR) clean

clean-docs:
	rm doc/*.html doc/*.png doc/*.css doc/edoc-info

test: all
        $(REBAR) skip_deps=true xref
        $(REBAR) skip_deps=true eunit

docs: clean-docs
	@$(REBAR) doc skip_deps=true

xref: compile
	@$(REBAR) xref skip_deps=true

