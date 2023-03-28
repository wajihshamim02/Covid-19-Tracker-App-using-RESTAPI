import 'dart:convert';

import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/Utilities/Api_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {

  Future<WorldStatesModel> fetchWorkStatesRecored() async {
    final responce = await http.get(Uri.parse(Apiurl.WorldstatesApi));

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> CountriesListApi() async {
    var data;
    final responce = await http.get(Uri.parse(Apiurl.countrieslist));

    if (responce.statusCode == 200) {
       data = jsonDecode(responce.body);
      // var data = jsonDecode(responce.body.toString());
      return data;
      // return WorldStatesModel.fromJson(data);
    } 
    else {
      throw Exception('Error');
    }
  }
}
