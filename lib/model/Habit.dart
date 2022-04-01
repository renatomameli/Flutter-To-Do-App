class Habit {
  final int id;
  final String name;
  final String notes;
  final List<String> successAtDate;

  Habit(this.id, this.name, this.notes, this.successAtDate);

  Habit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        notes = json['description'],
        successAtDate = json['successAtDate'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': notes,
    'successAtDate': successAtDate,
  };
}
