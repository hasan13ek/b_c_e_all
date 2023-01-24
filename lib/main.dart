import 'package:b_c_e_all/bloc/card_bloc.dart';
import 'package:b_c_e_all/bloc/card_event.dart';
import 'package:b_c_e_all/cubit/single_cubit.dart';
import 'package:b_c_e_all/data/apiservice/api_service.dart';
import 'package:b_c_e_all/data/repositories/card_repository.dart';
import 'package:b_c_e_all/single_bloc/single_bloc.dart';
import 'package:b_c_e_all/single_bloc/single_event.dart';
import 'package:b_c_e_all/ui/bloc_ui/page_2.dart';
import 'package:b_c_e_all/ui/cubit_ui/page_1.dart';
import 'package:b_c_e_all/ui/single_bloc_ui/page_4.dart';
import 'package:b_c_e_all/ui/single_cubit_ui/page_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
          create: (context) => MyRepository(apiservic: Apiservic()))
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                CardBloc(myRepository: context.read<MyRepository>())..add(GetAllData())),

        BlocProvider(create: (context)=>CardSingleBloc(myRepository: context.read<MyRepository>())..add(GetAllData1()))
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Padding(
        padding: const EdgeInsets.only(top: 88.0),
        child: Column(
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UsersCardsPage()));
            }, child: Text("Cubit")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UsersCardsPage2()));
            }, child: Text("Single Cubit")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UsersCardsPage1()));
            }, child: Text("Bloc")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>UsersCardsPage3()));
            }, child: Text("Single Bloc")),
          ],
        ),
      ),
    );
  }
}
