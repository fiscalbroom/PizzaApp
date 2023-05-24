import 'package:pizzaapp/data/topping.dart';

import 'pizza.dart';

class DemoData {
  static List<Pizza> pizzas = List.generate(10, (int index) {
    return Pizza(
      name: "Pizza Deliziosa ${index + 1}",
      price: 15 + (index * 3.0),
      rating: (index + 1) % 5,
      image: "assets/images/pizza${index + 1}.png",
    );
  });
  static List<Topping> toppings = [
    Topping(
      id: "1",
      name: "Cipolle",
      price: (3.0),
      flareArtboard: "Cipolle",
      thumbImage: "assets/images/toppings/onions_thumb.png",
    ),
    Topping(
      id: "2",
      name: "Olive verdi",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/green_chillies_thumb.png",
    ),
    Topping(
      id: "3",
      name: "Peperoni verdi",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/green_peppers_thumb.png",
    ),
    Topping(
      id: "4",
      name: "Halloumi",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/halloumi_thumb.png",
    ),
    Topping(
      id: "5",
      name: "Funghi",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/mushrooms_thumb.png",
    ),
    Topping(
      id: "6",
      name: "Olive",
      price: (3.0),
      flareArtboard: "Olive",
      thumbImage: "assets/images/toppings/olives_thumb.png",
    ),
    Topping(
      id: "7",
      name: "Ananas",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/pineapples_thumb.png",
    ),
    Topping(
      id: "8",
      name: "Mais Dolce",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/sweetcorn_thumb.png",
    ),
    Topping(
      id: "9",
      name: "Pomodori",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/tomatos_thumb.png",
    ),
    Topping(
      id: "9",
      name: "Mozarella",
      price: (3.0),
      flareArtboard: "Onions",
      thumbImage: "assets/images/toppings/mozarella_Cheese_thumb.png",
    ),
  ];
}