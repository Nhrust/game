#include <SFML/Graphics.hpp>
#include <fstream>
#include <string>


using namespace std;
using namespace sf;




class Room {
public:
    /* Attributes */
    int size_w, size_h;
    int *cells;
    RectangleShape rect;
    Vector2f cells_size;

    /* Constructors */
    Room();
    Room(int width, int height);
    
    /* Methods */
    void load(string filepath);
    void draw(RenderTarget *target);
    
    /* Destructors */
    ~Room();
};

