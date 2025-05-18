#include "room.hpp"

Room::Room()
{
    size_w = 0;
    size_h = 0;
    cells = nullptr;
    cells_size = Vector2f(10,10);
    rect = RectangleShape(cells_size);
}

Room::Room(int width, int heigth)
{
    size_w = width;
    size_h = heigth;
    cells = new int [width * heigth];
    cells_size = Vector2f(10,10);
    rect = RectangleShape(cells_size);
    

}

void Room::load(string filepath)
{
    delete cells;
    ifstream stream(filepath);
    stream >> size_w >> size_h;
    cells = new int [size_w*size_h];
    string line;
    for (int y = 0; y < size_h; y++) {
        stream >> line;
        for (int x = 0; x < size_w; x++) {
            if (line.at(x) == '#') {
                cells[y*size_w+x] = 1;
            
            }
            else {
                cells[y*size_w+x] = 0;
            }
        }
    }
    stream.close();
    
}

void Room::draw(RenderTarget *target)
{
    for (int i = 0; i < size_w*size_h; i++) {
        int y = i/size_w;
        int x = i-y*size_w;
        rect.setPosition(Vector2f(x*cells_size.x,y*cells_size.y));
        if (cells[i] == 0) {
            rect.setFillColor(Color(100,200,100));
        }
        else {
            rect.setFillColor(Color(10,50,10));
        }
        target->draw(rect);

    }
}

Room::~Room()
{
    delete cells;
}
