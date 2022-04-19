import 'package:bloc_app/constrains/strings.dart';
import 'package:dio/dio.dart';
import 'package:bloc_app/data/models/character.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //20 seconds
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    Response response = await dio.get('characters');
    print(response.data.toString());
    return response.data;

    // try {
    //   Response response = await dio.get('characters');
    //   print(response.data.toString());
    //   return response.data;
    // } catch (e) {
    //   print(e.toString());
    //   return [];
    // }
  }
}
