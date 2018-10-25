#include <stdio.h>
#include "Thermostat.h"

Thermostat::Thermostat (b2World *myworld, float32 mysigma) {
  sigma = mysigma;
  w = myworld;
  printWorldID ();
}

void Thermostat::printWorldID () {
  printf ("Hello World!\n");
}

void Thermostat::localThermostat (float32 timeStep) {
  for (b2Body *b = w->GetBodyList (); b; b = b->GetNext()) {
    // calculate coefficients
    float32 m = b->GetMass ();
    float32 friction = m*sigma;
    float32 gauss = sqrt (2*friction/timeStep);
    b2Vec2 vel = b->GetLinearVelocity();

    // calculate force
    float32 fx = gauss*r.nextRandom()-friction*vel.x;
    float32 fy = gauss*r.nextRandom()-friction*vel.y;

    // apply force
    b->ApplyForce(b2Vec2(fx,fy), b->GetWorldCenter(), true);
  }
}
