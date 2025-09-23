class Restoranlist {
  final bool error;
  final String message;
  final int count;
  final List<RestoranlistDetail> restoran;

  Restoranlist({
    required this.error,
    required this.message,
    required this.count,
    required this.restoran,
  });

  factory Restoranlist.fromjson(Map<String, dynamic> json) {
    return Restoranlist(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restoran: (json['restaurants'] as List ).map((e) => RestoranlistDetail.fromJson(e),).toList(),
    );
  }
}

class RestoranlistDetail{
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  RestoranlistDetail({required this.id, required this.name, required this.description, required this.pictureId, required this.city, required this.rating});
  
  factory RestoranlistDetail.fromJson(Map<String,dynamic> json){
    return RestoranlistDetail(id: json['id'], name: json['name'], description: json['description'], pictureId: json['pictureId'], city: json['city'], rating: (json['rating'] as num ).toDouble());
  }
}

class RestorainDetil {
  final bool error;
  final String message;

  final Restoran restoran;

  RestorainDetil({
    required this.error,
    required this.message,
    required this.restoran,
  });

  factory RestorainDetil.fromjson(Map<String, dynamic> json) {
    return RestorainDetil(
      error: json['error'],
      message: json['message'],

      restoran: Restoran.fromJson(json['restaurant']),
    );
  }
}

class Restoran {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;

  final String pictureId;
  final double rating;

  final List<Categories> categories;
  final Menu menu;

  final List<Review> review;

  Restoran({
    required this.review,
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.pictureId,
    required this.rating,
    required this.address,
    required this.menu,
    required this.categories,
  });

  factory Restoran.fromJson(Map<String, dynamic> json) {
    return Restoran(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      rating: (json['rating'] as num ).toDouble(),
      review: (json['customerReviews'] as List ).map((e) => Review.fromJson(e),).toList(),
      city: json['city'],
      address: json['address'],
      menu: Menu.fromjason(json['menus']),
      categories: (json['categories'] as List).map((e) => Categories.formJson(e),).toList(),
    );
  }
}

class Categories {
  final String name;
  Categories({required this.name});
  factory Categories.formJson(Map<String, dynamic> json) {
    return Categories(name: json['name']);
  }
}

class Menu {
  final List<Drink> drink;
  final List<Food> food;
  const Menu({required this.drink, required this.food});

  factory Menu.fromjason(Map<String, dynamic> json) {
    return Menu(
      drink: (json['foods'] as List).map((e) => Drink.fromJson(e)).toList(),
      food: (json['drinks'] as List).map((e) => Food.fromjson(e)).toList(),
    );
  }
}

class Drink {
  final String name;
  const Drink({required this.name});
  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(name: json['name']);
  }
}

class Food {
  final String name;
  const Food({required this.name});

  factory Food.fromjson(Map<String, dynamic> json) {
    return Food(name: json['name']);
  }
}

class Review {
  final String name;
  final String review;
  final String date;

  const Review({required this.name, required this.date, required this.review});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      name: json['name'],
      date: json['date'],
      review: json['review'],
    );
  }
}
