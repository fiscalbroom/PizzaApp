class Topping {
  final String id;
  final String name;
  final double price;
  final String thumbImage;
  final String flareArtboard;
  final String flareAsset = "assets/images/toppings/flare/pizza_toppings.flr";

  Topping(
      {required this.name,required this.price,required this.thumbImage,required this.id,required this.flareArtboard});

  @override
  String toString() {
    return "Pizza: {Id:$id Name: $name, Price: $price, Image: $thumbImage, FlareAsset: $flareAsset}";
  }
}