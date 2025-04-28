

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/country.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country Detail'),),

      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: 300,
              child: Hero(
                  tag: country.name!,
                  child: SvgPicture.network(country.flag!))),

          Text(country.name!, style: TextStyle(fontSize: 30),),
          Text(country.iso2!),
          Text(country.iso3!),
        ],
      ),
    );
  }
}
