class PlanModel {
  final String id;
  final String name;
  final DateTime date;
  bool done = false;

  PlanModel({required this.id, required this.name, required this.date});

  void changePerformance() {
    done = !done;
  }
}

class PlansModel {
  final List<PlanModel> _list = [];
  List<PlanModel> get ruyxat {
    return _list;
  }

  List<PlanModel> todoByDay(DateTime date) {
    return _list
        .where((todo) =>
            todo.date.day == date.day &&
            todo.date.month == date.month &&
            todo.date.year == date.year)
        .toList();
  }

  void addPlans(String planName, DateTime planDay) {
    _list.add(
      PlanModel(
        id: "id${_list.length + 1}",
        name: planName,
        date: planDay,
      ),
    );
  }

  void removePlan(String id) {
    _list.removeWhere((element) => element.id == id);
  }
}
