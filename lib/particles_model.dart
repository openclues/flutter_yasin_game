import 'package:flutter/animation.dart';

class Particle {
  double? x;
  double? y;
  Offset? off;

  Particle({
    this.x,
    this.y,
  });

  createListOfParticles(int number, double height, double width) {
    List<Particle> p;
    p = List.generate(number, (index) {
      return Particle(x: width / number, y: height / number);
    });
    return p;
  }
}
