CC = g++
CFLAGS = -Wall

all: build doczip

build: college.o course.o collegemain.o
	$(CC) $(CFLAGS) college.o course.o collegemain.o

college.o: college.cc college.h course.h node.h
	$(CC) -c college.cc

course.o: course.cc course.h
	$(CC) -c course.cc

collegemain.o: collegemain.cc course.h node.h college.h
	$(CC) -c collegemain.cc

doc:
	doxygen .

myexe:
	rename a.out myexe.out

doczip:
	zip myfiles.zip /html /latex

clean:
	rm -f *.o *.class *.out *.txt *.doc *.exe
	rm -rf html latex
	@echo "removed html and latex directory/folder if present."
