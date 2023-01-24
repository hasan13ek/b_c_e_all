import 'package:b_c_e_all/data/apiservice/my_response.dart';
import 'package:b_c_e_all/data/repositories/card_repository.dart';
import 'package:b_c_e_all/single_cubit/single_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCubit extends Cubit<CardSingleState>{
  SingleCubit({required this.myRepository}):super(InitialState()){
    _fetchAllData();
  }
  final MyRepository myRepository;

  _fetchAllData() async{
    emit(LoadInProgress());
    MyResponse myResponse = await myRepository.getAllData();
    if(myResponse.error.isEmpty){
      emit(LoadInSuccess(cards: myResponse.data));
    }else{
      emit(LoadInFailure(error: myResponse.error));
    }
  }

}