class ShoppingItems {
  String name;
  String quantity;
  bool isCheck;
  ShoppingItems(
      {required this.name, required this.quantity, this.isCheck = false});

  factory ShoppingItems.fromJson(Map<String, dynamic> json) {
    return ShoppingItems(
        name: json['name'],
        quantity: json["quantity"],
        isCheck: json['isCheck'] ?? false);
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'quantity': quantity, 'isCheck': isCheck};
  }
}
