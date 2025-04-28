import 'package:flutter/material.dart';

import '../../model/product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.product.title!)),
    body: Column(
      children: [
        Banner(
          location: BannerLocation.topStart,
            message: '${widget.product.discountPercentage} %',
            child: Image.network(widget.product.images![0], width: double.infinity, height: 200,)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              spacing: 5,

              children: [
                Text('Category'),
                CircleAvatar(
                  radius: 50,
                  child: Text(widget.product.category!, textAlign: TextAlign.center,),
                ),
              ],
            ),
            Column(
              spacing: 5,

              children: [
                Text('Price'),
                CircleAvatar(
                  radius: 50,
                  child: Text(widget.product.price.toString()),
                ),
              ],
            ),
            Column(
              spacing: 5,
              children: [
                Text('InStock'),
                CircleAvatar(
                  radius: 50,
                  child: Text(widget.product.stock.toString()),
                ),
              ],
            ),
          ],
        ),

        TextButton(onPressed: (){

          List<Reviews> reviews = widget.product.reviews!;



        }, child: const Text('Reviews')),
      ],
    ),
    );
  }
}
