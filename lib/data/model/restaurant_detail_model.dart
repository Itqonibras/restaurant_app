class RestaurantDetailResult {
  bool? error;
  String? message;
  RestaurantDetail? restaurant;

  RestaurantDetailResult({this.error, this.message, this.restaurant});

  RestaurantDetailResult.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    restaurant = json['restaurant'] != null
        ? RestaurantDetail.fromJson(json['restaurant'])
        : null;
  }
}

class RestaurantDetail {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  List<Categories>? categories;
  Menus? menus;
  num? rating;
  List<CustomerReviews>? customerReviews;

  RestaurantDetail(
      {this.id,
        this.name,
        this.description,
        this.city,
        this.address,
        this.pictureId,
        this.categories,
        this.menus,
        this.rating,
        this.customerReviews});

  RestaurantDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    address = json['address'];
    pictureId = json['pictureId'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
    rating = json['rating'];
    if (json['customerReviews'] != null) {
      customerReviews = <CustomerReviews>[];
      json['customerReviews'].forEach((v) {
        customerReviews!.add(CustomerReviews.fromJson(v));
      });
    }
  }
}

class Categories {
  String? name;

  Categories({this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class Menus {
  List<Foods>? foods;
  List<Drinks>? drinks;

  Menus({this.foods, this.drinks});

  Menus.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods!.add(Foods.fromJson(v));
      });
    }
    if (json['drinks'] != null) {
      drinks = <Drinks>[];
      json['drinks'].forEach((v) {
        drinks!.add(Drinks.fromJson(v));
      });
    }
  }
}

class Foods {
  String name;

  Foods({
    required this.name,
  });

  factory Foods.fromJson(Map<String, dynamic> json) => Foods(
    name: json["name"],
  );
}

class Drinks {
  String name;

  Drinks({
    required this.name,
  });

  factory Drinks.fromJson(Map<String, dynamic> json) => Drinks(
    name: json["name"],
  );
}

class CustomerReviews {
  String? name;
  String? review;
  String? date;

  CustomerReviews({this.name, this.review, this.date});

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    review = json['review'];
    date = json['date'];
  }
}
