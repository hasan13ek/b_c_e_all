import 'package:b_c_e_all/data/apiservice/api_service.dart';
import 'package:b_c_e_all/data/apiservice/my_response.dart';

class MyRepository{
  MyRepository({required Apiservic apiservic}){
    _apiservic = apiservic;
  }
  late Apiservic _apiservic;

  Future<MyResponse> getAllData()=>_apiservic.getAllCards();
}