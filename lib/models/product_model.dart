class ProductModel {
  final int id;
  final double price;
  final String title, description, category, image;

  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['images'][0],
    );
  }
}
