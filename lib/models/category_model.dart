class CategoryModel {
  final String slug, name;

  CategoryModel({
    required this.slug,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      slug: json['slug'],
      name: json['name'],
    );
  }
}
