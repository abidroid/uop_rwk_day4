import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uop_rwk_day4/screens/product/product_detail_screen.dart';

import '../../model/product.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  Future<List<Product>> getAllProducts() async {
    String url = 'https://dummyjson.com/products';
    List<Product> products = [];
    print("before request");

    var response = await http.get(Uri.parse(url));

    print("**************************************");
    print(response.body);
    //if( response.statusCode == 200 || response.statusCode == 201 ){

    var jsonData = jsonDecode(response.body);
    var jsonProductList = jsonData['products'];

    print('yes');
    for (var jsonProduct in jsonProductList) {
      print('inside loop');
      Product product = Product.fromJson(jsonProduct);
      products.add(product);
    }

    // }else{
    //
    // }


    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products'),),

      body: FutureBuilder(future: getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),

                    itemBuilder: (context, index){

                    Product product = products[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return ProductDetailScreen(product: product);
                        }));

                      },
                      child: Card(
                        color: Colors.pink[100],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                     Image.network(product.thumbnail!, width: 100, height: 80,
                                     fit: BoxFit.cover,
                                     ),
                                      Text(product.title!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18),)

                            ],
                          ),
                        ),
                      ),
                    );
                    }),
              );

              // return ListView.builder(
              //     itemCount: products.length,
              //     itemBuilder: (context, index){
              //
              //       Product product = products[index];
              //   return Card(
              //     color: Colors.pink[100],
              //     child: Row(
              //       children: [
              //
              //         Image.network(product.thumbnail!, width: 100, height: 80,),
              //         Text(product.title!)
              //       ],
              //     ),
              //   );
              // });


            } else {
              return Center(child: SpinKitWave(color: Colors.purple,),);
            }
          }),
    );
  }
}
