import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/quantity_selector.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/data/models/cart_item.dart';

class ProductsSelectorCard extends StatefulWidget {
  ProductsSelectorCard({super.key, required this.cartItem, required this.onDeletePressed});
  CartItem cartItem;
  final VoidCallback onDeletePressed;
  @override
  State<ProductsSelectorCard> createState() => _ProductsSelectorCardState();
}

class _ProductsSelectorCardState extends State<ProductsSelectorCard> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.network(
                widget.cartItem.product.image!,
                width: 100,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cartItem.product.name!,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.left,
                  ),
                  IconButton(
                    onPressed: widget.onDeletePressed,
                    icon: FaIcon(
                      FontAwesomeIcons.trash,
                      color: Theme.of(context).colorScheme.error.withAlpha(150),
                      size: 20,
                    ),
                  ),
                ],
              ),
              
              Text(widget.cartItem.product.categoryName!),
              QuantitySelector(
                  quantity: widget.cartItem.quantity,
                  onDecrement: () {
                    if (widget.cartItem.quantity > 1) {
                      setState(() {
                        widget.cartItem.quantity--;
                        print('====== ${widget.cartItem.quantity}');
                      });
                    }
                  },
                  onIncrement: () => setState(() {
                        widget.cartItem.quantity++;
                        print('====== ${widget.cartItem.quantity}');
                      }),
                  product: widget.cartItem.product)
            ],
          )
        ],
      ),
    );
  }
}
