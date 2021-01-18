class Planet {
  final String name;
  final String description;

  Planet({this.name, this.description});

  Planet.providedJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'];

  Planet.nullPlanet()
      : name = 'Null',
        description = 'Null';
}
