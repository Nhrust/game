#include <SFML/Graphics.hpp>
#include "room.hpp"

using namespace sf;

class MyWindow
{

public:
    VideoMode mode;
    RenderWindow window;
    Room test;
    MyWindow(/* args */);
    void run();
    ~MyWindow();
};


