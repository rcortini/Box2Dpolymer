#ifndef __THERMOSTAT_H__
#define __THERMOSTAT_H__

#include <Box2D/Box2D.h>
#include <random>

class myRandom {
  public :
    myRandom () {
      gen = new std::mt19937 (rd ());
      d = new std::normal_distribution<> (0.,1.);
    }
    float32 nextRandom () {
      return (*d) (*gen);
    }
  private :
    std::random_device rd;
    std::normal_distribution<> *d;
    std::mt19937 *gen;
};


class Thermostat {
  public :
    Thermostat (b2World *myworld, float32 mysigma);
    void printWorldID ();
    void localThermostat (float32 timeStep);
  private :
    float32 sigma;
    b2World * w;
    myRandom r;
};

#endif
