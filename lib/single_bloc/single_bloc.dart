import 'package:b_c_e_all/data/apiservice/my_response.dart';
import 'package:b_c_e_all/data/repositories/card_repository.dart';
import 'package:b_c_e_all/single_bloc/single_event.dart';
import 'package:b_c_e_all/single_bloc/single_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardSingleBloc extends Bloc<CardSingleBlocEvent,CardSingleBlocState>{
  CardSingleBloc({required this.myRepository}):super(InitialState()){
    on<GetAllData1>(_fetchAllData);
  }

  final MyRepository myRepository;

  _fetchAllData(GetAllData1 event, Emitter<CardSingleBlocState> emit) async {
    MyResponse myResponse = await myRepository.getAllData();
    emit(LoadInProgress());
    if(myResponse.error.isEmpty){
      emit(LoadInSuccess(cards: myResponse.data));
    }else{
      emit(LoadInFailure(error: myResponse.error));
    }
  }
}