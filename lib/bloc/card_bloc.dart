import 'package:b_c_e_all/bloc/card_event.dart';
import 'package:b_c_e_all/bloc/card_state.dart';
import 'package:b_c_e_all/data/apiservice/my_response.dart';
import 'package:b_c_e_all/data/repositories/card_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc({required this.myRepository}) : super(InitialState()) {
    on<GetAllData>(_fetchAllData);
  }

  final MyRepository myRepository;

  _fetchAllData(GetAllData event, Emitter<CardState> emit) async {
    MyResponse myResponse = await myRepository.getAllData();
    emit(LoadInProgress());
    if(myResponse.error.isEmpty){
      emit(LoadInSuccess(cards: myResponse.data));
    }else{
      emit(LoadInFailure(error: myResponse.error));
    }
  }
}
