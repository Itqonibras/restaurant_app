import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'restaurant_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Restaurant API Check', () {
    test('Return List Restaurant', () async {
      final client = MockClient();

      when(client.get(Uri.parse(ApiService.baseUrl + ApiService.list)))
          .thenAnswer((_) async => http.Response(
              '{"error":false,"message":"success","count":20,"restaurants":[]}',
              200));
      expect(await ApiService(client: client).restaurant(),
          isA<RestaurantResult>());
    });
  });
}
