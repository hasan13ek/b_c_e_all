import 'package:b_c_e_all/data/apiservice/api_client.dart';
import 'package:b_c_e_all/data/apiservice/my_response.dart';
import 'package:b_c_e_all/data/models/card_model.dart';
import 'package:dio/dio.dart';

class Apiservic extends ApiClient {
  Future<MyResponse> getAllCards() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data as List).map((e) => CardModel.fromJson(e)).toList();
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
