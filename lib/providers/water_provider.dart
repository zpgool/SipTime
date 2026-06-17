import 'package:flutter/material.dart';
import '../models/water_record.dart';

class WaterProvider extends ChangeNotifier {
  int goal = 2000;

  int totalWater = 0;

  final List<WaterRecord> records = [];

  void addWater(int amount) {
    totalWater += amount;

    records.insert(
      0,
      WaterRecord(
        amount: amount,
        time: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  void deleteRecord(int index) {
    totalWater -= records[index].amount;
    records.removeAt(index);

    notifyListeners();
  }

  void clearRecords() {
    totalWater = 0;
    records.clear();

    notifyListeners();
  }

  double get progress => totalWater / goal;

  void increaseGoal() {
  goal += 100;
  notifyListeners();
}

void decreaseGoal() {
  if (goal > 100) {
    goal -= 100;
    notifyListeners();
  }
}
}