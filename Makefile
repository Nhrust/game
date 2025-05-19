# Allowed targets: arch_mingw_w64, win_mingw_w64
target = arch_mingw_w64

# BUILD
TEMP_DIR = temp
DEFS     = 
LOG      = ${TEMP_DIR}/build.log

# SFML
SFML_INCLUDE_DIR  = /home/admin/.SFML3/include
SFML_LIB_DIR      = /home/admin/.SFML3/lib
SFML_LIBS         = -l sfml-graphics-s -l sfml-window-s -l sfml-system-s

# WIN
WIN_GRAPHIC_LIBS  = -l freetype
WIN_WINDOW_LIBS   = -l gdi32 -l opengl32
WIN_AUDIO_LIBS    = -l flac -l vorbisenc -l vorbisfile -l vorbis -l ogg
WIN_SYSTEM_LIBS   = -l winmm
WIN_STATIC_LIBS   = -static -static-libgcc -static-libstdc++

# ARCH
ARCH_GRAPHIC_LIBS = -l X11 -l Xext -l Xrender -l Xxf86vm -l Xcomposite \
					-l Xdamage -l xcb-image -l xcb-xfixes
ARCH_WINDOW_LIBS  = -l Xrandr -l Xcursor -l Xi -l Xinerama -l Xfixes \
					-l xcb -l xcb-randr -l xcb-keysyms -l xcb-icccm \
					-l xcb-sync -l xcb-shape -l xcb-xkb -l xcb-util
ARCH_AUDIO_LIBS   = -l openal  # -lflac / -lvorbis / -lvorbisenc / -logg
ARCH_SYSTEM_LIBS  = -l udev -l Xau -l Xdmcp




# Config
BUILD         = debug
LINKING_FLAGS = 

ifeq (${RELEASE}, release)
    COMPILE_FLAGS = -O3

else
    COMPILE_FLAGS = -Wall

endif

INCLUDE_DIRS  = -I include -I ${SFML_INCLUDE_DIR}
LIB_DIRS      = -L source -L ${TEMP_DIR} -L ${SFML_LIB_DIR}

ifeq (${target}, arch_mingw_w64)
    OUT  = game
    LIBS = ${SFML_LIBS} ${ARCH_SYSTEM_LIBS} ${ARCH_WINDOW_LIBS} ${ARCH_GRAPHIC_LIBS}

else ifeq (${target}, win_mingw_w64)
    OUT       = build/game.exe
    LIBS      = ${SFML_LIBS} ${WIN_SYSTEM_LIBS} ${WIN_WINDOW_LIBS} ${WIN_GRAPHIC_LIBS} ${WIN_STATIC_LIBS}
    DEFS     += -D SFML_STATIC
    LIB_DIRS += -L ./build

else
    ${error Unexpected target}

endif




ALL: log game


%.o: source/%.cpp 
	@echo Building - $@
	@echo g++ -c $^ -o ${TEMP_DIR}/$@ ${COMPILE_FLAGS} ${INCLUDE_DIRS} ${LIB_DIRS} ${LIBS} ${DEFS} >> ${LOG}
	@g++ -c $^ -o ${TEMP_DIR}/$@ ${COMPILE_FLAGS} ${INCLUDE_DIRS} ${LIB_DIRS} ${LIBS} ${DEFS} >> ${LOG}


# make targets
player.o: source/player.cpp
room.o:   source/room.cpp
window.o: source/window.cpp
OBJECTS = player.o room.o window.o


main.o: main.cpp ${OBJECTS}
	@echo Building - $@
	@echo g++ -c $< -o ${TEMP_DIR}/$@ ${COMPILE_FLAGS} ${INCLUDE_DIRS} ${LIB_DIRS} ${LIBS} ${DEFS} >> ${LOG}
	@g++ -c $< -o ${TEMP_DIR}/$@ ${COMPILE_FLAGS} ${INCLUDE_DIRS} ${LIB_DIRS} ${LIBS} ${DEFS} >> ${LOG}

game: main.o ${OBJECTS}
	@echo Linking  - ${OUT}
	@echo g++ ${addprefix ${TEMP_DIR}/, $^} -o ${OUT} ${LINKING_FLAGS} ${INCLUDE_DIRS} ${LIB_DIRS} ${LIBS} ${DEFS} >> ${LOG}
	@g++ ${addprefix ${TEMP_DIR}/, $^} -o ${OUT} ${LINKING_FLAGS} ${INCLUDE_DIRS} ${LIB_DIRS} ${LIBS} ${DEFS} >> ${LOG}
	@echo. >> ${LOG}

log:
	@rm -rf ${LOG}
	@echo # BUILD >> ${LOG}
	@echo target        = ${target} >> ${LOG}
	@echo BUILD         = ${BUILD} >> ${LOG}
	@echo OUT           = ${OUT} >> ${LOG}
	@echo DEFS          = ${XXX} >> ${LOG}
	@echo. >> ${LOG}
	@echo # COMPILATION >> ${LOG}
	@echo COMPILE_FLAGS = ${COMPILE_FLAGS} >> ${LOG}
	@echo LIB_DIRS      = ${LIB_DIRS} >> ${LOG}
	@echo LIBS          = ${LIBS} >> ${LOG}
	@echo OBJECTS       = ${OBJECTS} >> ${LOG}
	@echo. >> ${LOG}
	@echo # LINKING >> ${LOG}
	@echo LINKING_FLAGS = ${LINKING_FLAGS} >> ${LOG}
	@echo INCLUDE_DIRS  = ${INCLUDE_DIRS} >> ${LOG}
	@echo. >> ${LOG}

clear:
	@echo Clear project...
	@rm -rf ${TEMP_DIR}/*.o
	@rm -rf game*