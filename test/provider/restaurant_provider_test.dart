import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_model.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([http.Client])
void main() {
  group('Restaurant API Check', () {
    test('Return List Restaurant', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client!.get(Uri.parse('${ApiService.baseUrl}${ApiService.list}')))
          .thenAnswer((_) async => http.Response(
              '{"error":false,"message":"success","count":20,"restaurants":[]}',
              200));

      expect(await ApiService(client: client).restaurant(), isA<Restaurant>());
    });
  });
}
