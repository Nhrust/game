#include <SFML/Graphics.hpp>
#include <fstream>
#include <string>

using namespace std;
using namespace sf;

class Room
{
public:
    int size_w;
    int size_h;
    int *cells;
    RectangleShape rect;
    Vector2f cells_size;
    Room();
    Room(int width, int height);
    void load(string filepath);
    void draw(RenderTarget *target);
    ~Room();
};

