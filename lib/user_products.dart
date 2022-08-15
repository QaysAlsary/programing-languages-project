class UserProducts {
  String? name, image;
  var id;

  UserProducts({
    required this.name,
    required this.image,
    required this.id,
  });

  factory UserProducts.fromJson(Map<String, dynamic> json) => UserProducts(
      image: json['photo_path'], name: json['name'], id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'photo_path': image,
      };
}

List<UserProducts> userproducts = [
  UserProducts(
    image: "images/orang.png",
    name: "orang",
    id: 1,
  ),
];
