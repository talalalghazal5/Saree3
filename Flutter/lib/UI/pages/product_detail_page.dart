import 'package:flutter/material.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/data/models/product.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String quantity = '1';

  @override
  Widget build(BuildContext context) {
    final TextEditingController quantityController =
        TextEditingController();
        
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  widget.product.name!,
                  style: Theme.of(context).textTheme.headlineLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                //Navigate to this vendor page.
              },
              child: Text(
                widget.product.vendorName!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.product.price}',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                Row(
                  children: [
                    const Text(
                      '4.7 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            FilterChip(
              label: Text(widget.product.categoryName!),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              onSelected: (value) {},
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'About this product:',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 19),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.product.description!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.surfaceContainer),
            ),

            const SizedBox(
              height: 10,
            ),

            //Text(product.image),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .inverseSurface
                        .withAlpha(60),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'In Stock: ${widget.product.stockQuantity!}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print('${widget.product.name}');
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Select a quantity:'),
                          content: TextField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => quantityController.text = value,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surfaceContainer)),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  quantity = quantityController.text;
                                });
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Select',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      const Text(
                        'QTY:',
                      ),
                      Text(
                        quantity,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 80 / 100,
                  child: PrimaryButton(
                    onPressed: () {},
                    text: 'Add to Cart',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
