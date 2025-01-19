import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/services/order_service.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.id});
  final int id;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    // CartProvider cartProvider = Provider.of<CartProvider>(context);
    UserController userController =
        Provider.of<UserController>(context, listen: false);
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
                  .getOrderById(widget.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
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
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Address'),
                              Text(userController.user.location!),
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
                              Text('Order Status:'),
                              Text(snapshot.data!.orderStatus),
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
                              Text('Total Cost:'),
                              Text('\$${snapshot.data!.totalPrice}'),
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
                              const Text('Ordered A:'),
                              Text(DateFormat('EEE, d/M/y - HH:mm')
                                  .format(snapshot.data!.orderDate!)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              height: 450,
                              child: ListView.builder(
                                itemCount: snapshot.data!.orderItems!.length,
                                itemBuilder: (context, index) {
                                  // CartItem cartItem = cartProvider.cart[index];
                                  return ListTile(
                                    contentPadding: const EdgeInsets.only(
                                      left: 5,
                                      right: 10,
                                      bottom: 5,
                                      top: 5,
                                    ),
                                    tileColor: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface
                                        .withAlpha(30),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    leading: Image.network(
                                      snapshot.data!.orderItems![index].product
                                          .image!,
                                      width: 50,
                                    ),
                                    title: Text(
                                      snapshot.data!.orderItems![index].product
                                          .name!,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    subtitle: Text(
                                      'Price: ${snapshot.data!.orderItems![index].product.price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inverseSurface),
                                    ),
                                    trailing: Text(
                                      'QTY: ${snapshot.data!.orderItems![index].quantity}',
                                      style: const TextStyle(fontSize: 13),
                                    ),
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
                      Text('Error Occured'),
                      MaterialButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text(
                          'Try again',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface),
                        ),
                      ),
                    ],
                  );
                }

                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
