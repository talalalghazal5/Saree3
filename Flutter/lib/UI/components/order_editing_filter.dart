import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/pages/order_editing.dart';
import 'package:saree3/controllers/user_controller.dart';
import 'package:saree3/data/models/order.dart';
import 'package:saree3/services/order_service.dart';

class OrderEditingFilter extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const FaIcon(FontAwesomeIcons.arrowLeft));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('no data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    UserController userController = Provider.of<UserController>(context);
    return FutureBuilder(
      future: OrderService().getOrdersByStatus('pending'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error Occured'),
          );
        } else if (snapshot.data == null) {
          return const Center(
            child: Text('No orders found'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Order order = snapshot.data![index];
              return GestureDetector(
                onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => OrderEditing(id: order.id),)),
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
                          const Text('Delivery Address:'),
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
                          const Text('Total Cost:'),
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
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(hintStyle: Theme.of(context).textTheme.headlineSmall),
      appBarTheme: AppBarTheme(
        titleTextStyle: Theme.of(context).textTheme.bodyMedium,
        
      )
    );
  }

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search for an order by it\'s ID';

}
