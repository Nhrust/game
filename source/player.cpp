#include "player.hpp"

Player::Player(int pos_x, int pos_y)
{
    x = pos_x;
    y = pos_y;
    hp = 100;
    point = 0;
}

Player::~Player()
{
}

Weapon::Weapon()
{
    damage = 0;
    level = 0;
    krit = 0;
}

Weapon::Weapon(int w_damage, int w_level, float w_krit)
{
    damage = w_damage;
    level = w_level;
    krit = w_krit;

}

Weapon::~Weapon()
{
}

MeleeWeapon::MeleeWeapon(/* args */)
{
}

MeleeWeapon::~MeleeWeapon()
{
}
