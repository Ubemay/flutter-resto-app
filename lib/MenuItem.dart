class MenuItem {
  final int id;
  final String name;
  final String image;
  final String ingredients;
  final int preparationTime;
  final int price;
  String? lastComment;

  MenuItem({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.preparationTime,
    required this.price,
    this.lastComment,
  });
}
