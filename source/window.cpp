#include "window.hpp"




MyWindow::MyWindow() {
    mode = VideoMode(Vector2u(400,400));
    window.create(mode,"game");
    window.setFramerateLimit(60);
    test = Room();
    test.load("source/worlds/world.txt");
}


void MyWindow::run() {
    while (window.isOpen()) {
        while (const std::optional event = window.pollEvent()) {
            if (event->is<sf::Event::Closed>())
                window.close();
        }
        
        window.clear();
        
        test.draw(&window);

        window.display();
    }
}


MyWindow::~MyWindow() {
}