DIR:=$(shell basename $(shell pwd))

run: build
	java -Dfile.encoding=UTF-8 -cp build/libs/$(DIR)-fat.jar:build/libs/$(DIR).jar fr.usmb.m1isc.compilation.simple.Main

build: src/main/jflex/Simple.flex src/main/cup/Simple.cup
	./gradlew clean && ./gradlew build
