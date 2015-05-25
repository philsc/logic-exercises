.PHONY: default all

sources = logic.uml

diagrams = $(sources:.uml=.svg)

default: all

all: $(diagrams)

%.svg: %.uml
	plantuml $^
