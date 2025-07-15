NIM=nim
NIMFLAGS=c -o:nifetch

all:
	@$(NIM) $(NIMFLAGS) main.nim

clean:
	@rm nifetch

install: all
	@sudo cp nifetch /usr/bin/nifetch

uninstall:
	@sudo rm /usr/bin/nifetch
