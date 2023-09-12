import 'package:flutter/foundation.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_detail_model.dart';
import 'restaurant_provider.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  final String id;

  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _fetchRestaurantDetail(id);
  }

  late RestaurantDetailResult _restaurantDetailResult;
  late ResultState _state;
  String _message = "";

  String get message => _message;

  RestaurantDetailResult get result => _restaurantDetailResult;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurantDetail(id);
      if (restaurant.error!) {
        _state = ResultState.noData;
        notifyListeners();
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantDetailResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Hmm, check your internet connection!';
    }
  }
}
