#include <SFML/Graphics.hpp>

using namespace sf;

class Player
{

public:
    int x;
    int y;
    int hp;
    int point;
    Player(int pos_x, int pos_y);
    ~Player();
};

class Weapon
{

public:
    int damage;
    int level;
    float krit;
    Weapon();
    Weapon(int damage, int level, float krit);
    ~Weapon();
};

class MeleeWeapon : public Weapon
{

public:
    MeleeWeapon(/* args */);
    ~MeleeWeapon();
};




