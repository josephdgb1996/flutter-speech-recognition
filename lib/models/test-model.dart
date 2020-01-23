import 'package:proyect/models/signal-model.dart';

class Test{
  List<Question> questions;
  int note;
  Test({
    this.questions,
    this.note
  });
}

class Question{
  bool check;
  Signal signal;
  Question({
    this.check,
    this.signal
  });
}