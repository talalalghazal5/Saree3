import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/homePageComponents/shoppingCartComponents/productSelector/product_selector_card.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/services/order_service.dart';

class OrderEditing extends StatefulWidget {
  const OrderEditing({super.key, required this.id});
  final int id;

  @override
  State<OrderEditing> createState() => _OrderEditingState();
}

class _OrderEditingState extends State<OrderEditing> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Provider.of<UserController>(context);
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
              future: OrderService().getOrderById(widget.id),
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
                              const Text('Order Status:'),
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
                              const Text('Total Cost:'),
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
                                  CartItem cartItem =
                                      snapshot.data!.orderItems![index];
                                  return ProductsSelectorCard(
                                      cartItem: cartItem);
                                },
                              )),
                          // Spacer(),
                          MaterialButton(
                            onPressed: () =>
                                snapshot.data!.orderItems!.removeAt(0),
                            child: Text('remove'),
                          ),
                          PrimaryButton(
                              onPressed: () {
                                print(
                                    'The new order is: ${snapshot.data!.orderItems!} =================');
                                    OrderService().updateOrder(snapshot.data!.id, snapshot.data!.orderItems!);
                              },
                              text: 'Save'),
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Error Occured'),
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
