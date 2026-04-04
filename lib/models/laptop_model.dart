// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LaptopModel {
  final String? id;
  final String? name;
  final String? color;
  final int? price;
  final String? image;
  LaptopModel({
    this.id,
    this.name,
    this.color,
    this.price,
    this.image,
  });
  

  LaptopModel copyWith({
    String? id,
    String? name,
    String? color,
    int? price,
    String? image,
  }) {
    return LaptopModel(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'color': color,
      'price': price,
      'image': image,
    };
  }

  factory LaptopModel.fromMap(Map<String, dynamic> map) {
    return LaptopModel(
      id: map['id'] != null ? map['id'] as String : "-1",
      name: map['name'] != null ? map['name'] as String : "unknow name",
      color: map['color'] != null ? map['color'] as String : "unknow color",
      price: map['price'] != null ? map['price'] as int : -1,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LaptopModel.fromJson(String source) => LaptopModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LaptopModel(id: $id, name: $name, color: $color, price: $price, image: $image)';
  }

  @override
  bool operator ==(covariant LaptopModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.color == color &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      color.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
