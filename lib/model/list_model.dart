class ItemList {
  static List<ModelList> lst = [];
}

class ModelList {
  String itemName;
  String currentDate;
  String cTime;
  String amount;

  ModelList(
      {required this.itemName,
      required this.currentDate,
      required this.cTime,
      required this.amount});
}
