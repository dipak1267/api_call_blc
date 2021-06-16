
import 'package:api_call_blc/Model/Model_class.dart';
import 'package:api_call_blc/reposetoory/repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class nameevent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Serchname extends nameevent{
  final name;

  Serchname(this.name);
  List<Object> get proops => [name];
}
class reset extends nameevent{

}

class NameState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class NameIsSerching extends NameState{}
class NameIsSerched extends NameState{

  final _name;
  NameIsSerched(this._name);
  Moodel get getmoodel => _name;
  @override
  List<Object> get props => [_name];
}
class NameIsNotSerch extends NameState{}
class NameIsNotLoaded extends NameState{}

class NameBloc extends Bloc<nameevent,NameState>{
  ageRepo  Agerepo;

  NameBloc(this.Agerepo) : super(NameIsNotSerch());

  @override
  Stream<NameState> mapEventToState(nameevent event) async*{
   if(event is Serchname){
     yield NameIsSerching();

     try {
       Moodel Age = await Agerepo.getdata(event.name);
      yield NameIsSerched(Age);

     } catch (_){
       NameIsNotLoaded();
     }
   }
   if(event is reset ){
     yield NameIsNotSerch();
   }


  }
}
