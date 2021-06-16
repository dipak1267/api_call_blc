
import 'package:api_call_blc/Model/Model_class.dart';
import 'package:api_call_blc/blocs/name_bloc.dart';
import 'package:flutter/material.dart';
import 'package:api_call_blc/reposetoory/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {


  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  var response = ageRepo();

  Widget build(BuildContext context) {
    var Name = TextEditingController();
    final namebloc = BlocProvider.of<NameBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Center(
      child: Text("Find Your Age",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),),
    ),
            BlocBuilder<NameBloc,NameState>(
             builder: (context, state) {
               if(state is NameIsNotSerch){
                 print(state);
                  return Ui(Name,namebloc);
             }else if(state is NameIsSerching)
               return Center(child : CircularProgressIndicator(),);

             else if(state is NameIsSerched)
            return name(state.getmoodel);
               else 
             return Text("Error",style: TextStyle(color: Colors.black),);
    })


  ],

  ),
  );
}
Ui(TextEditingController name,var bloc)
{
  return Center(
    child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid)),
                hintText: "Your Name",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          Center(
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.blue[400]),
                onPressed: () {
                  bloc.add(Serchname(name.text));
                },
                child: Text("Search Age")),
          ),
        ],
      ),
    ),
  );
}
}



class name extends StatelessWidget {
  Moodel model;

  name(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30,),
            Text("${model.getname} Your Age is${model.getage.toString()}",style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),

          OutlinedButton(onPressed: (){
            try{

              BlocProvider.of<NameBloc>(context).add(reset());
            }catch(e){print(e);}
          }, child: Text('Serch again')),

          ],
        )
    );
  }
}