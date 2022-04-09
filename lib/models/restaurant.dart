class Restaurant {
  final String name;
  final String category;
  final String deliveryTaxe;
  final String distance;
  final double rate;
  final List<int> time;
  final bool favorite;
  final String photoUrl;

  Restaurant(
      {required this.name,
      required this.photoUrl,
      required this.category,
      required this.deliveryTaxe,
      required this.distance,
      required this.rate,
      required this.time,
      required this.favorite});

  Restaurant changefav({
    bool? favorite,
  }) {
    return Restaurant(
        name: this.name,
        category: this.category,
        deliveryTaxe: this.deliveryTaxe,
        distance: this.distance,
        rate: this.rate,
        time: this.time,
        favorite: this.favorite,
        photoUrl: this.photoUrl);
  }
}
