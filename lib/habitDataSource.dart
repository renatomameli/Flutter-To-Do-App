import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'habit.dart';

class HabitDataSource extends DataGridSource {
  HabitDataSource(List<Habit> habits) {
    _habits = habits.map((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<bool>(columnName: 'twoDaysBefore', value: e.successAtDate[dateToString(new DateTime(_now.year, _now.month, _now.day-2))]),
      DataGridCell<bool>(columnName: 'oneDaysBefore', value: e.successAtDate[dateToString(new DateTime(_now.year, _now.month, _now.day-1))]),
      DataGridCell<bool>(columnName: 'oneDaysBefore', value: e.successAtDate[dateToString(_now)]),
      DataGridCell<bool>(columnName: 'tomorrow', value: e.successAtDate[dateToString(new DateTime(_now.year, _now.month, _now.day+1))]),
    ]))
        .toList();
    
  }
  
  List<DataGridRow> _habits = [];
  DateTime _now = DateTime.now();

  @override
  List<DataGridRow> get rows =>  _habits;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            alignment: (dataGridCell.columnName == 'id' || dataGridCell.columnName == 'salary')
                ? Alignment.centerRight
                : Alignment.centerLeft,
            padding: EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }


  String dateToString(DateTime date){
    return date.toString().substring(0,10);
  }


}