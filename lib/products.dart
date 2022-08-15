// List<Products>postFromJson(String)
class Products {
  final String? image, title, type, expairDate, contact;
  var count, id;
  var price;

  Products({
    required this.image,
    required this.title,
    required this.type,
    required this.expairDate,
    required this.contact,
    required this.price,
    required this.count,
    required this.id,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      image: json['photo_path'],
      title: json['name'],
      type: json['category'],
      expairDate: json['expiry_date'],
      contact: json['phone_number'],
      price: json['price'],
      count: json['quantity'],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': title,
        'photo_path': image,
        'category': type,
        'expiry_date': expairDate,
        'phone_number': contact,
        'price': price,
        'quantity': count
      };
}

List<Products> products = [
  Products(
    image: "images/orang.png",
    title: "orang",
    type: "frots",
    expairDate: "11 1  2022",
    contact: "0940715870",
    price: 200,
    count: 20,
    id: 1,
  ),
  Products(
    image: "images/jaoz.png",
    title: "jaoz",
    type: "beens",
    expairDate: "11 1  2022",
    contact: "0940715870",
    price: 300,
    count: 10,
    id: 2,
  ),
  Products(
    image: "images/Blueberry.png",
    title: "Blueberry",
    type: "fruit",
    expairDate: "11 1  2022",
    contact: "0940715870",
    price: 650,
    count: 48,
    id: 3,
  ),
  Products(
    image: "images/Tomato.png",
    title: "Tomato",
    type: "vegetables",
    expairDate: "11 1  2022",
    contact: "0940715870",
    price: 300,
    count: 80,
    id: 4,
  ),
  Products(
    image: "images/lamb.png",
    title: "lamb",
    type: "meat",
    expairDate: "11 1  2022",
    contact: "0940715870",
    price: 500,
    count: 14,
    id: 5,
  ),
  Products(
    image: "images/meat.png",
    title: "meat",
    type: "meat",
    expairDate: "11 1  2022",
    contact: "0940715870",
    price: 600,
    count: 10,
    id: 6,
  ),
];
