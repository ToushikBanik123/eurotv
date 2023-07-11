class Category {
  final String catName;
  final String catLogo;

  Category({required this.catName, required this.catLogo});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      catName: json['cat_name'],
      catLogo: json['cat_logo'],
    );
  }
}
