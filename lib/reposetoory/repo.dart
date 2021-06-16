
import 'package:http/http.dart';
import 'package:api_call_blc/Model/Model_class.dart';

class ageRepo{
  Future<Moodel> getdata(String name)async{

    var res = await get(Uri.parse('https://api.agify.io/?name=${name}'));

    if(res.statusCode != 200)  throw Exception();

    print(res.body);
    return moodelFromJson(res.body);
  }
}