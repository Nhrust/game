#include <SFML/Graphics.hpp>


using namespace sf;




class Player {
public:
    int x, y;
    int hp;
    int point;

    Player(int x, int y);
    ~Player();
};




class Weapon {
public:
    /* Attributes */
    int damage;
    int level;
    float krit;

    /* Constructors */
    Weapon();
    Weapon(int damage, int level, float krit);
    
    /* Methods */
    //...

    /* Destructor */
    ~Weapon();
};


class MeleeWeapon : public Weapon {
public:
    /* Attributes */
    // ...

    /* Constructors */
    MeleeWeapon();

    /* Methods */
    // ...

    /* Destructor */
    ~MeleeWeapon();
};
