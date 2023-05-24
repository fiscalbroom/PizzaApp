import 'package:pizzaapp/data/topping.dart';

class Pizza {
  final String name;
  final double price;
  final int rating;
  final String image;
  Set<Topping> toppings;

  Pizza({
    this.name = "",
    this.price = 0,
    this.rating = 0,
    this.image = "",
    this.toppings = const {},
  }) : assert(rating <= 5, "La valutazione deve essere minore di 5.");

  @override
  String toString() {
    return "Pizza: {Name: $name, Price: $price, Rating: $rating, Image: $image, Toppings: $toppings}";
  }

  double getTotal() {
    double toppingPrice = 0.0;
    toppings.forEach((topping) {
      toppingPrice += topping.price;
    });
    return price + toppingPrice;
  }

  void resetToppings() {
    toppings = {};
  }
}