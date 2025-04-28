
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uop_rwk_day4/screens/country_detail_screen.dart';

import '../model/country.dart';
import 'package:http/http.dart' as http;

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {

  Future<List<Country>> getAllCountries() async {

    List<Country> countries = [];
    String endPoint = 'https://countriesnow.space/api/v0.1/countries/flag/images';

    // request api
    // get response

    var response = await http.get(Uri.parse(endPoint));

    if( response.statusCode == 200 ){

      var json = jsonDecode(response.body);
      var jsonCountries = json['data'];

      for( var jsonCountry in jsonCountries){

        Country country = Country.fromJson(jsonCountry);
        countries.add(country);
      }
    }else{

    }
    // extract all countries
    // store in the array



    // return list
    return countries;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Country List'),),

      body: FutureBuilder(future: getAllCountries(),
          builder: ( BuildContext context, AsyncSnapshot snapshot ){



            if( snapshot.hasData){

              List<Country> countries = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index){

                      Country country = countries[index];

                      return InkWell(
                        onTap: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return CountryDetailScreen(country: country);
                          }));
                        },
                        child: Card(

                          color: Colors.amber[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              spacing: 20,
                              children: [
                                SizedBox(
                                    width: 100,
                                    height: 80,
                                    child: Hero(
                                        tag: country.name!,
                                        child: SvgPicture.network(country.flag!))),
                                Expanded(child: Text(country.name ?? '', style: TextStyle(fontSize: 20,),)),
                              ],
                            ),
                          ),
                        ),
                      );

                    }),
              );

            }else{
              return Center(child: SpinKitWave(color: Colors.pink,),);
            }
          }),
    );
  }
}
