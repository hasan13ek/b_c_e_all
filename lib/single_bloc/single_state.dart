import 'package:b_c_e_all/data/models/card_model.dart';
import 'package:equatable/equatable.dart';
abstract class CardSingleBlocState extends Equatable{

  const CardSingleBlocState();
  @ override
  List<Object> get props => [];
}





class InitialState extends CardSingleBlocState{}

class LoadInProgress extends CardSingleBlocState{}

class LoadInSuccess extends CardSingleBlocState{
  const LoadInSuccess({required this.cards});
  final List<CardModel> cards;
}

class LoadInFailure extends CardSingleBlocState{
  const LoadInFailure({required this.error});
  final String error;
}