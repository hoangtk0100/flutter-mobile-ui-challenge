import 'package:flutter/material.dart';

class Shoe {
  String name;
  String brand;
  String description;
  double price;
  List<String> sizeNumbers;
  List<Color> colors;

  Shoe({
    this.name,
    this.brand,
    this.description,
    this.price,
    this.sizeNumbers,
    this.colors,
  });

  toString() {
    return '$brand <$name, $price>';
  }
}
