class Habit {
  final int id;
  final String name;
  final String description;
  final List<String> successAtDate;

  Habit(this.id, this.name, this.description, this.successAtDate);

  Habit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        successAtDate = json['successAtDate'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'successAtDate': successAtDate,
  };
}