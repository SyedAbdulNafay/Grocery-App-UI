class Item {
  final String image;
  final String title;
  final String quantity;
  final double price;
  int count;
  final String detail;

  Item({
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
    this.count = 0,
    required this.detail
  });
}