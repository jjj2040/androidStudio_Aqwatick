

timeOut(){
  final now2 = DateTime.now();
  return now2;
}

timeres(){
  var minuteForm = '';
  var monthVarForm = '';
  final now2 = DateTime.now();
  var yearVar = now2.year;
  var monthVar = now2.month;
  var dayVar = now2.day;
  var hourVar = now2.hour;
  var minuteVar = now2.minute;
  var secondVar = now2.second;

  if (monthVar < 10){
    //var monthVarForm = monthVar.toString();
    monthVarForm = ('0' + monthVar.toString());
  }else {monthVarForm = monthVar.toString();
  };


  if (minuteVar < 10){
    // var minuteForm = minuteVar.toString();
    minuteForm = ('0' + minuteVar.toString());
  }else {minuteForm = minuteVar.toString();
  };

  String dataLine = '$yearVar-$monthVarForm-$dayVar $hourVar:$minuteForm:$secondVar';
  return dataLine;
}

//дата сплошная линия
timeres111() {
  var minuteForm = '';
  var monthVarForm = '';
  final now2 = DateTime.now();
  var yearVar = now2.year;
  var monthVar = now2.month;
  var dayVar = now2.day;
  var hourVar = now2.hour;
  var minuteVar = now2.minute;
  var secondVar = now2.second;

  if (monthVar < 10) {
    //var monthVarForm = monthVar.toString();
    monthVarForm = ('0' + monthVar.toString());
  } else {
    monthVarForm = monthVar.toString();
  };


  if (minuteVar < 10) {
    // var minuteForm = minuteVar.toString();
    minuteForm = ('0' + minuteVar.toString());
  } else {
    minuteForm = minuteVar.toString();
  };

  var dataLine = '$yearVar$monthVarForm$dayVar$hourVar$minuteForm$secondVar';
  var myInt = int.parse('$dataLine');
  return myInt;
}