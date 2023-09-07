class RestaurantSearchResult {
  bool? error;
  num? founded;
  List<RestaurantSearch>? restaurants;

  RestaurantSearchResult({this.error, this.founded, this.restaurants});

  RestaurantSearchResult.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantSearch>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantSearch.fromJson(v));
      });
    }
  }
}

class RestaurantSearch {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  num? rating;

  RestaurantSearch(
      {this.id,
        this.name,
        this.description,
        this.pictureId,
        this.city,
        this.rating});

  RestaurantSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
  }
}
