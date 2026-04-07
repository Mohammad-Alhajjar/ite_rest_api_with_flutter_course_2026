// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

ProductModel productModelFromMap(String str) => ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
    final int? id;
    final String? title;
    final String? description;
    final String? category;
    final double? price;
    final double? discountPercentage;
    final double? rating;
    final int? stock;
    final List<String>? tags;
    final String? brand;
    final String? sku;
    final int? weight;
    final Dimensions? dimensions;
    final String? warrantyInformation;
    final String? shippingInformation;
    final String? availabilityStatus;
    final List<Review>? reviews;
    final String? returnPolicy;
    final int? minimumOrderQuantity;
    final Meta? meta;
    final List<String>? images;
    final String? thumbnail;

    ProductModel({
        this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.tags,
        this.brand,
        this.sku,
        this.weight,
        this.dimensions,
        this.warrantyInformation,
        this.shippingInformation,
        this.availabilityStatus,
        this.reviews,
        this.returnPolicy,
        this.minimumOrderQuantity,
        this.meta,
        this.images,
        this.thumbnail,
    });

    ProductModel copyWith({
        int? id,
        String? title,
        String? description,
        String? category,
        double? price,
        double? discountPercentage,
        double? rating,
        int? stock,
        List<String>? tags,
        String? brand,
        String? sku,
        int? weight,
        Dimensions? dimensions,
        String? warrantyInformation,
        String? shippingInformation,
        String? availabilityStatus,
        List<Review>? reviews,
        String? returnPolicy,
        int? minimumOrderQuantity,
        Meta? meta,
        List<String>? images,
        String? thumbnail,
    }) => 
        ProductModel(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
            category: category ?? this.category,
            price: price ?? this.price,
            discountPercentage: discountPercentage ?? this.discountPercentage,
            rating: rating ?? this.rating,
            stock: stock ?? this.stock,
            tags: tags ?? this.tags,
            brand: brand ?? this.brand,
            sku: sku ?? this.sku,
            weight: weight ?? this.weight,
            dimensions: dimensions ?? this.dimensions,
            warrantyInformation: warrantyInformation ?? this.warrantyInformation,
            shippingInformation: shippingInformation ?? this.shippingInformation,
            availabilityStatus: availabilityStatus ?? this.availabilityStatus,
            reviews: reviews ?? this.reviews,
            returnPolicy: returnPolicy ?? this.returnPolicy,
            minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
            meta: meta ?? this.meta,
            images: images ?? this.images,
            thumbnail: thumbnail ?? this.thumbnail,
        );

    factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null ? null : Dimensions.fromMap(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"],
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromMap(x))),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toMap(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toMap())),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toMap(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail,
    };
}

class Dimensions {
    final double? width;
    final double? height;
    final double? depth;

    Dimensions({
        this.width,
        this.height,
        this.depth,
    });

    Dimensions copyWith({
        double? width,
        double? height,
        double? depth,
    }) => 
        Dimensions(
            width: width ?? this.width,
            height: height ?? this.height,
            depth: depth ?? this.depth,
        );

    factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "depth": depth,
    };
}

class Meta {
    final String? createdAt;
    final String? updatedAt;
    final String? barcode;
    final String? qrCode;

    Meta({
        this.createdAt,
        this.updatedAt,
        this.barcode,
        this.qrCode,
    });

    Meta copyWith({
        String? createdAt,
        String? updatedAt,
        String? barcode,
        String? qrCode,
    }) => 
        Meta(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            barcode: barcode ?? this.barcode,
            qrCode: qrCode ?? this.qrCode,
        );

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        barcode: json["barcode"],
        qrCode: json["qrCode"],
    );

    Map<String, dynamic> toMap() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "barcode": barcode,
        "qrCode": qrCode,
    };
}

class Review {
    final int? rating;
    final String? comment;
    final String? date;
    final String? reviewerName;
    final String? reviewerEmail;

    Review({
        this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail,
    });

    Review copyWith({
        int? rating,
        String? comment,
        String? date,
        String? reviewerName,
        String? reviewerEmail,
    }) => 
        Review(
            rating: rating ?? this.rating,
            comment: comment ?? this.comment,
            date: date ?? this.date,
            reviewerName: reviewerName ?? this.reviewerName,
            reviewerEmail: reviewerEmail ?? this.reviewerEmail,
        );

    factory Review.fromMap(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: json["date"],
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
    );

    Map<String, dynamic> toMap() => {
        "rating": rating,
        "comment": comment,
        "date": date,
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
    };
}
