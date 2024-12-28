import 'package:flutter/material.dart';
import 'package:saree3/data/models/product_model.dart';
import 'package:saree3/ui/components/homePageComponents/shoppingCartComponents/productSelector/quantity_selector_button.dart';

class ProductsSelectorCard extends StatelessWidget {
  ProductsSelectorCard({super.key,required this.productSelector});
  ProductModel productSelector;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 150,
        width: 450,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color:Color(0xffE6E6E8) ,),
      
        
        child: Card(
          clipBehavior: Clip.none,
        color: Color(0xffE6E6E8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
        Container(
          height: 134,
          width: 125 ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white),
          child: Center(child: Image.asset(productSelector.image),),
        ),
         Padding(
           padding: const EdgeInsets.only(left: 8.0),
           child: Container(
            height: 134,
            width: 100,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productSelector.name),
                          SizedBox(height: 10,),
                          Container(color: Color(0xffB5A9F5),child: Text(productSelector.categoryName)),
                          SizedBox(height: 20,),
                          Text('total:'),
                          Text(r'$' '${productSelector.price.toString()}',style: TextStyle(color:Color(0xff240CAA)),)
                        ],
                      ),
           ),
         ),
        Container(
          height: 134,
          width: 70,
          child: Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                            
                            QuantitySelectorButton()
                      ],
                    ),
        )
            ],
          ),
        ),
        ),
      ),
    );
  }
}
