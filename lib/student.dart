class Student {
  String id;
  String name;
  int scores;

  Student({this.id, this.name, this.scores});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
      id: parsedJson['id'],
      name: parsedJson['name'],
      scores: parsedJson['score']
    );
  }
}