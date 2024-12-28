import 'package:flutter/material.dart';
import 'package:saree3/data/models/product_model.dart';
import 'package:saree3/ui/components/custom_button.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key,required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white) ,child: Image.asset(productModel.image,height: 400,width: double.infinity,)),
            
            Row(
              children: [
                Text(productModel.name),
              ],
            ),
            Row(children: [
              Text('4.7'),
              Icon(Icons.star,color:Color(0xff808082),),
                            Icon(Icons.star,color:Color(0xff808082),),
              Icon(Icons.star,color:Color(0xff808082),),
              Icon(Icons.star,color:Color(0xff808082),),
              Icon(Icons.star,color:Color(0xff808082),)

            ],),
             SizedBox(
              height: 10,
            ),
        
            Text(r'$''${productModel.price.toString()}',style: TextStyle(color: Color(0xffEDA086),fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(
              height: 10,
            ),
            Text('About this product :'),
            Text(productModel.description),
                        Text('Key Features :'),
                        Container(child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(children: [
                            Text('. data'),
                            Text('. data'),
                            Text('. data'),
                          ],),
                        ),),

            SizedBox(
              height: 10,
            ),
        
            //Text(product.image),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Column(
              children: [
                Text('QTY:'),
                Text('1')
              ],
            ),
            CustomButton(buttonName: 'Add to Cart',width: 290,)
          ],
        )        ],
        ),
      ),
    );
  }
}
