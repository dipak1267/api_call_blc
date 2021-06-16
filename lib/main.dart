import 'package:api_call_blc/reposetoory/repo.dart';
import 'package:api_call_blc/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/name_bloc.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: BlocProvider(
        create: (context) => NameBloc(ageRepo()),
         child:  Homescreen(),
      ),
    ),
  ));
}