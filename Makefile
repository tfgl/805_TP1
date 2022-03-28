run: build
	java -Dfile.encoding=UTF-8 -cp build/libs/2-fat.jar:build/libs/2.jar fr.usmb.m1isc.compilation.simple.Main

build: src/main/jflex/Simple.flex src/main/cup/Simple.cup
	./gradlew clean && ./gradlew build
