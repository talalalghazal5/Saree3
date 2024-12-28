import 'package:flutter/material.dart';
import 'package:saree3/data/models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.width,
      required this.product});
  double width;
  
  ProductModel product;


 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            
            
           // height: height,
            width: width,
            decoration: BoxDecoration( boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  offset: Offset(10, 10)),
            ]),
            child: Card(
              color: Color(0xffE6E6E8) ,
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)),color: Colors.white),
                    child: Image.asset(
                      product.image,
                      height: 125,
                    //  height: height - 125,
                      width:double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price.toString()}',style: TextStyle(color: Color(0xffEDA086)),),
                        Icon(
                          Icons.favorite_border_rounded,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Positioned(top: 0, left: 0, child:Image.asset(product.image,height: 125,width: double.infinity,)),
        ],
      ),
    );
  }
}
