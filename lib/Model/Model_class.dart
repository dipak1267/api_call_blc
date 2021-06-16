import 'dart:convert';

Moodel moodelFromJson(String str) => Moodel.fromJson(json.decode(str));


class Moodel {
  Moodel({
    required this.name,
    required this.age,
    required this.count,
  });

  String name;
  int age;
  int count;

  String get getname => name;
  int get getage => age;

  factory Moodel.fromJson(Map<String, dynamic> json) => Moodel(
    name: json["name"],
    age: json["age"],
    count: json["count"],
  );
  //
  // Map<String, dynamic> toJson() => {
  //   "name": name,
  //   "age": age,
  //   "count": count,
  // };
}