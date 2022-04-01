abstract class Habit {
  int? id;
  late String name;
  late String question;
  String? notes;
  List<String>? successAtDate;

  Habit();

  void setId(int id){this.id = id;}
  void setName(String name){this.name = name;}
  void setQuestion(String question){this.question = question;}
  void setNotes(String notes){this.notes = notes;}
  void setSuccessAtDate(List<String> successAtDates){this.successAtDate = successAtDates;}

  String getName(){return this.name;}
}
