class Item {
  String id;
  String name;
  String img;
  double price;
  int qnt = 0;
  int stock;

  Item(
    this.id,
    this.name,
    this.img,
    this.price,
    this.stock,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        json['id'],
        json['name'],
        json['img'],
        json['price'],
        json['stock'],
      );

  factory Item.fromJsonAndId(String id, Map<String, dynamic> json) => Item(
        id,
        json['name'],
        json['img'],
        json['price'],
        json['stock'],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "img": img,
      "price": price,
      "qnt": qnt,
    };
  }
}
