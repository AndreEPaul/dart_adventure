import 'dart:convert';
import 'dart:io';
import 'package:dart_adventure/dart_adventure.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    print('Please provide json file with planet information.');
    print('Example of usage: dart bin/main.dart bin/planetarySystem.json');
    return;
  }

  // filepath now should be in arguments[0]

  File(arguments[0]).readAsString().then((String fileData) => SpaceAdventure(
          planetarySystem: PlanetarySystem.providedJson(jsonDecode(fileData)))
      .start());
}
