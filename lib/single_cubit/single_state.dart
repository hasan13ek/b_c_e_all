import 'package:b_c_e_all/data/models/card_model.dart';
import 'package:equatable/equatable.dart';
abstract class CardSingleState extends Equatable{

  const CardSingleState();
 @ override
  List<Object> get props => [];
}





class InitialState extends CardSingleState{}

class LoadInProgress extends CardSingleState{}

class LoadInSuccess extends CardSingleState{
  const LoadInSuccess({required this.cards});
  final List<CardModel> cards;
}

class LoadInFailure extends CardSingleState{
  const LoadInFailure({required this.error});
  final String error;
}