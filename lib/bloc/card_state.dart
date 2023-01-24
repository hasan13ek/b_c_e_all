import 'package:b_c_e_all/data/models/card_model.dart';

abstract class CardState{}

class InitialState extends CardState{}

class LoadInProgress extends CardState{}

class LoadInSuccess extends CardState{
  LoadInSuccess({required this.cards});
  final List<CardModel> cards;
}

class LoadInFailure extends CardState{
  LoadInFailure({required this.error});
  final String error;
}