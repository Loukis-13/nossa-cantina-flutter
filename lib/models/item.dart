class Item {
  String name;
  String img;
  double price;
  double qnt = 0.0;
  int stock;

  Item(
    this.name,
    this.img,
    this.price,
    this.stock
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        json['name'],
        json['img'],
        json['price'],
        json['stock']
      );
}
