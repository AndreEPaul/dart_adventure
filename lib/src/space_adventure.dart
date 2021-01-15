import 'dart:io';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {
  final PlanetarySystem planetarySystem;

  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\'s go on an adventure!');
    if (planetarySystem.hasPlanets) {
      travel(promptForRandomOrSpecificDestination(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Uh oh, there are no planets in this system.');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!\n'
        'There are ${planetarySystem.numberOfPlanets} planets to explore.');
  }

  void printIntroduction(String name) {
    print(
        'Nice to meet you, $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  void travel(bool randomChoice) {
    if (randomChoice) {
      travelToPlanet(planetarySystem.randomPlanet());
    } else {
      final planetChoice = stdin.readLineSync();
      travelTo(planetChoice);
    }
  }

  void travelToPlanet(Planet planet) {
    print('Traveling to ${planet.name}...');
    print('Arrived at ${planet.name}. ${planet.description}');
  }

  void travelTo(String planetChoice) {
    print('Traveling to ${planetChoice}...\n');
    planetarySystem.planets.forEach((planet) {
      if (planet.name == planetChoice) {
        print('Arrived at ${planet.name}. ${planet.description}');
      }
    });
  }

  bool promptForRandomOrSpecificDestination(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') {
      print(prompt);
      answer = stdin.readLineSync();
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Please enter Y or N as your choice.');
      }
    }

    return false;
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }
}
