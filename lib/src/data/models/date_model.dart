class Year {
  int year;
  // int total;
  double total;
  double max;

  List<Month> months;

  Year({required this.year, required this.months, required this.total, required this.max});
}

class Month {
  int month;
  String name;
  double max;
  double total;
  List<Day> days;

  Month(
      {required this.month,
      required this.name,
      required this.days,
      required this.total,
      required this.max});
}

class Day {
  int day;
  double total;

  Day({required this.day, required this.total});
}