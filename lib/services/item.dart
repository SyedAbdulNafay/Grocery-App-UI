class Item {
  final String image;
  final String title;
  final String quantity;
  final double price;
  int count;
  final String detail;

  Item(
      {required this.image,
      required this.title,
      required this.quantity,
      required this.price,
      this.count = 0,
      required this.detail});

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'quantity': quantity,
      'price': price,
      'count': count,
      'detail': detail
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        image: map['image'],
        title: map['title'],
        quantity: map['quantity'],
        price: map['price'],
        count: map['count'],
        detail: map['detail']);
  }
}
