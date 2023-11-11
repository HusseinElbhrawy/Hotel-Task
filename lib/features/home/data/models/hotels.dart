import 'dart:convert';

import 'package:equatable/equatable.dart';

class Hotels extends Equatable {
  final String name;
  final num starts;
  final num price;
  final String currency;
  final String image;
  final num reviewScore;
  final String review;
  final String address;

  const Hotels({
    required this.name,
    required this.starts,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  Hotels copyWith({
    String? name,
    int? starts,
    double? price,
    String? currency,
    String? image,
    double? reviewScore,
    String? review,
    String? address,
  }) {
    return Hotels(
      name: name ?? this.name,
      starts: starts ?? this.starts,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      image: image ?? this.image,
      reviewScore: reviewScore ?? this.reviewScore,
      review: review ?? this.review,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'starts': starts,
      'price': price,
      'currency': currency,
      'image': image,
      'review_score': reviewScore,
      'review': review,
      'address': address,
    };
  }

  factory Hotels.fromMap(Map<String, dynamic> map) {
    return Hotels(
      name: map['name'],
      starts: map['starts'],
      price: map['price'],
      currency: map['currency'],
      image: map['image'],
      reviewScore: map['review_score'],
      review: map['review'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotels.fromJson(String source) =>
      Hotels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      starts,
      price,
      currency,
      image,
      reviewScore,
      review,
      address,
    ];
  }
}
