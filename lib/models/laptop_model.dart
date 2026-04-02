// ignore_for_file: public_member_api_docs, sort_constructors_first
class LaptopModel {
  String id;
  String name;
  String color;
  int price;
  String image;

  LaptopModel({
    required this.id,
    required this.name,
    required this.color,
    required this.price,
    required this.image,
  });

 static LaptopModel fromMap(Map<String, dynamic> map) {
    return LaptopModel(
      id: map["id"],
      name: map["name"],
      color: map["color"],
      price: map["price"],
      image: map["image"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "color": color,
      "price": price,
      "image": image,
    };
  }
}
