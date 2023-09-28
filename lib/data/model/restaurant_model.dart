class RestaurantResult {
  bool? error;
  String? message;
  int? count;
  List<Restaurant>? restaurants;

  RestaurantResult({this.error, this.message, this.count, this.restaurants});

  RestaurantResult.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurant>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(Restaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['count'] = count;
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  num? rating;

  Restaurant(
      {this.id,
        this.name,
        this.description,
        this.pictureId,
        this.city,
        this.rating});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pictureId'] = pictureId;
    data['city'] = city;
    data['rating'] = rating;
    return data;
  }
}
