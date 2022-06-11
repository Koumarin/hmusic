test:
	ghc Tests.hs -e "test"
	javac -cp "./jsyn-20171016.jar:." Track.java JavaRuntime/Runtime.java
	java -cp "./jsyn-20171016.jar:." Track

example:
	ghc song/Song.hs JavaBackend.hs -e 'JavaBackend.compileJava song 240.0 "Track"'
	javac -cp "./jsyn-20171016.jar:." Track.java JavaRuntime/Runtime.java
	java  -cp "./jsyn-20171016.jar:." Track
