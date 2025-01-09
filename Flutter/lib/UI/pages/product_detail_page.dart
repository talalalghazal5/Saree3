import 'package:flutter/material.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/data/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Image.network(
                'https://placehold.co/500x500.png',
                height: 400,
                width: double.infinity,
              ),
            ),

            Row(
              children: [
                Text(product.name!),
              ],
            ),
            const Row(
              children: [
                Text('4.7'),
                Icon(
                  Icons.star,
                  color: Color(0xff808082),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xff808082),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xff808082),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xff808082),
                ),
                Icon(
                  Icons.star,
                  color: Color(0xff808082),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Text(
              r'$' '${product.price.toString()}',
              style: const TextStyle(
                  color: Color(0xffEDA086),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('About this product :'),
            Text(product.description!),
            const Text('Key Features :'),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text('. data'),
                    Text('. data'),
                    Text('. data'),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //Text(product.image),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [Text('QTY:'), Text('1')],
                ),
                PrimaryButton(onPressed: () {}, text: 'Add to Cart')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
