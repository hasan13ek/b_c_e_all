import 'package:b_c_e_all/data/models/card_model.dart';

abstract class CardCubitState{}

class InitialState extends CardCubitState{}

class LoadInProgress extends CardCubitState{}

class LoadInSuccess extends CardCubitState{
  LoadInSuccess({required this.cards});
  final List<CardModel> cards;
}

class LoadInFailure extends CardCubitState{
  LoadInFailure({required this.error});
  final String error;
}