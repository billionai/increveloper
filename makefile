COMP = g++
COMPFLAG = -O3 -std=c++17 -c -march=native -g
LINKFLAGS = -lm -lpanel -lmenu -lncurses
NOME = increveloper
CFILES = $(wildcard *.cpp)
OFILES = $(CFILES:.cpp=.o)

all: $(NOME)

$(NOME): $(OFILES)
	$(COMP) $(OFILES) $(LINKFLAGS) -o $(NOME)

%.o:%.cpp %.h
	$(COMP) $(COMPFLAG) $(FOLDER)$< -o $@

main.o:main.cpp
	$(COMP) $(COMPFLAG) $(FOLDER)$< -o $@


run: $(NOME)
	./$(NOME)

debug:
	gdb ./$(NOME)

val:
	valgrind ./$(NOME)

clean:
	rm $(OFILES) $(NOME)
