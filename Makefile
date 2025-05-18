SFML_LIBS=-l sfml-graphics-s -l sfml-window-s -l sfml-system-s
SFML_LIB=/home/admin/.SFML3/lib
SFML_INCLUDE=/home/admin/.SFML3/include
LIBS = -lX11 -lXrandr -lXext -lXcursor -lXi -lXinerama -lXxf86vm -lXrender -lXau -lXdmcp -lXfixes -lXcomposite -lXdamage -lxcb -lxcb-randr -lxcb-image -lxcb-keysyms -lxcb-icccm -lxcb-sync -lxcb-xfixes -lxcb-shape -lxcb-xkb -lxcb-util -ludev

ALL: game

room.o: source/room.cpp
	g++ -c source/room.cpp -o temp/room.o -I include -I ${SFML_INCLUDE} -L ${SFML_LIB} ${SFML_LIBS} ${LIBS}

player.o: source/player.cpp
	g++ -c source/player.cpp -o temp/player.o -I include -I ${SFML_INCLUDE} -L ${SFML_LIB} ${SFML_LIBS} ${LIBS}

window.o: source/window.cpp room.o player.o
	g++ -c source/window.cpp -o temp/window.o -I include -I ${SFML_INCLUDE} -L ${SFML_LIB} ${SFML_LIBS} ${LIBS}

main.o: main.cpp room.o player.o window.o
	g++ -c main.cpp -o temp/main.o -L temp -I include -I ${SFML_INCLUDE} -L ${SFML_LIB} ${SFML_LIBS} ${LIBS}

game: main.o
	g++ temp/main.o temp/window.o temp/room.o -L temp -o game -I include -I ${SFML_INCLUDE} -L ${SFML_LIB} ${SFML_LIBS} ${LIBS}

clear: 
	rm -rf temp/*.o