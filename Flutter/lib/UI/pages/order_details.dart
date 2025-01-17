import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/services/order_service.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: OrderService()
                  .placeNewOrder(Provider.of<CartProvider>(context).cart),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  String formattedDate = DateFormat('EEE, d/m/y - HH:mm')
                      .format(snapshot.data!.orderDate!);
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Order ID:'),
                              Text('${snapshot.data!.id}'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(60),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('User ID:'),
                              Text(
                                '${snapshot.data!.userId}',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(60),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Address'),
                              Text('As Suwayda, Syria'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(60),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order Status'),
                              Text('Pending'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(60),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Cost:'),
                              Text('\$1999.5'),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withAlpha(60),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Ordered At'),
                              Text(DateFormat('EEE, d/m/y - HH:mm')
                                  .format(DateTime.now())),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            height: 450,
                              child: ListView.builder(
                            itemCount: cartProvider.cart.length,
                            itemBuilder: (context, index) {
                              CartItem cartItem = cartProvider.cart[index];
                              return ListTile(
                                contentPadding: const EdgeInsets.only(left: 5, right: 10, bottom: 5, top: 5),
                                tileColor: Theme.of(context).colorScheme.inverseSurface.withAlpha(30),
                                shape: const BeveledRectangleBorder(side: BorderSide(width: 2, color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(10))),
                                leading: Image.network(
                                  cartItem.product.image!,
                                  width: 50,
                                ),
                                title: Text(
                                  cartItem.product.name!,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                subtitle: Text(
                                  'Price: ${cartItem.product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface),
                                ),
                                trailing:
                                    Text('QTY: ${cartItem.quantity}', style: const TextStyle(fontSize: 13),),
                              );
                            },
                          ))
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(snapshot.error.toString()),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
