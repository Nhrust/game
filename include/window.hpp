#include <SFML/Graphics.hpp>
#include "room.hpp"


using namespace sf;




class MyWindow {
public:
    /* Attributes */
    VideoMode mode;
    RenderWindow window;
    Room test;
    
    /* Constructors */
    MyWindow();
    
    /* Methods */
    void run();

    /* Destructors */
    ~MyWindow();
};
