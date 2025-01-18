import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/order_editing_filter.dart';
import 'package:saree3/UI/pages/order_details.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/data/models/order.dart';
import 'package:saree3/services/order_service.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Future<void> refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    OrderService orderService = OrderService();
    UserController userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Order History',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: OrderEditingFilter());
              },
              icon: FaIcon(
                FontAwesomeIcons.pen,
                color: Theme.of(context).colorScheme.onSurface,
              )),
          IconButton(
              onPressed: refresh,
              icon: FaIcon(
                FontAwesomeIcons.arrowRotateLeft,
                color: Theme.of(context).colorScheme.onSurface,
              )),
        ],
      ),
      body: FutureBuilder(
        future: orderService.getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No orders found'),
            );
          } else if (snapshot.hasError) {
            return Text('Could not get orders');
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Order order = snapshot.data![index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => OrderDetails(),)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Order ID:'),
                            Text('${order.id}'),
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
                            Text('Delivery Address:'),
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
                            Text(order.orderStatus),
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
                            Text('\$${order.totalPrice}'),
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
                            Text(DateFormat('EEE, d/M/y - HH:mm')
                                .format(order.orderDate!)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
