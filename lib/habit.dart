class Habit {
  final int id;
  final String name;
  final String description;
  final List<String> successAtDate;

  Habit(this.id, this.description, this.name, this.successAtDate);
  factory Habit.fromJson(dynamic json){
    return Habit(json['id'] as int, json['name'] as String, json['description'] as String, json['successAtDate'] as List<String>);
  }
}