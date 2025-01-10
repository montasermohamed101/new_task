import 'package:cleancode/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
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
    double? weight,
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
  }) : super(
    id: id,
    title: title,
    description: description,
    category: category,
    price: price,
    discountPercentage: discountPercentage,
    rating: rating,
    stock: stock,
    tags: tags,
    brand: brand,
    sku: sku,
    weight: weight,
    dimensions: dimensions,
    warrantyInformation: warrantyInformation,
    shippingInformation: shippingInformation,
    availabilityStatus: availabilityStatus,
    reviews: reviews,
    returnPolicy: returnPolicy,
    minimumOrderQuantity: minimumOrderQuantity,
    meta: meta,
    images: images,
    thumbnail: thumbnail,
  );

  // Convert JSON to ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price']?.toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble(),
      rating: json['rating']?.toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight']?.toDouble(),
      dimensions: json['dimensions'] != null
          ? Dimensions(
        width: json['dimensions']['width']?.toDouble(),
        height: json['dimensions']['height']?.toDouble(),
        depth: json['dimensions']['depth']?.toDouble(),
      )
          : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: json['reviews'] != null
          ? List<Review>.from(
        json['reviews'].map((x) => Review(
          rating: x['rating']?.toDouble(),
          comment: x['comment'],
          date: x['date'],
          reviewerName: x['reviewerName'],
          reviewerEmail: x['reviewerEmail'],
        )),
      )
          : null,
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null
          ? Meta(
        createdAt: json['meta']['createdAt'],
        updatedAt: json['meta']['updatedAt'],
        barcode: json['meta']['barcode'],
        qrCode: json['meta']['qrCode'],
      )
          : null,
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'],
    );
  }

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions != null
          ? {
        'width': dimensions!.width,
        'height': dimensions!.height,
        'depth': dimensions!.depth,
      }
          : null,
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews != null
          ? List<dynamic>.from(
        reviews!.map((x) => {
          'rating': x.rating,
          'comment': x.comment,
          'date': x.date,
          'reviewerName': x.reviewerName,
          'reviewerEmail': x.reviewerEmail,
        }),
      )
          : null,
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta != null
          ? {
        'createdAt': meta!.createdAt,
        'updatedAt': meta!.updatedAt,
        'barcode': meta!.barcode,
        'qrCode': meta!.qrCode,
      }
          : null,
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}