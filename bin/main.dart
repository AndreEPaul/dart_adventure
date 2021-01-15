import 'package:dart_adventure/dart_adventure.dart';

void main(List<String> arguments) {
  SpaceAdventure(
    planetarySystem: PlanetarySystem(
      name: 'Solar System', planets: [
        Planet(
          name: 'Mercury', 
          description: 'A very hot planet, closest to the sun.'
        )
      ]
    )
  ).start();
}
