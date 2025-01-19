import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saree3/UI/components/misc/primary_button.dart';
import 'package:saree3/UI/pages/order_details.dart';
import 'package:saree3/controllers/cart_provider.dart';
import 'package:saree3/data/models/cart_item.dart';
import 'package:saree3/data/models/order.dart';
import 'package:saree3/services/order_service.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _processPayment(List<CartItem> items) async {
    if (_formKey.currentState!.validate()) {
      // Add your payment processing logic here
      try {
        Order order = await OrderService().placeNewOrder(items);
        if (items.isNotEmpty) {
          Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                builder: (context) => OrderDetails(id: order.id),
              ));
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Payment Successful'),
              content: Text('Thank you for your payment!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
        if (items.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Your cart is empty, order some products first')));
        }
      } on Exception catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Page',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: ListView(
            children: [
              // Cardholder Name
              TextFormField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the cardholder name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Card Number
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                maxLength: 16,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 16) {
                    return 'Please enter a valid card number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Expiry Date
              TextFormField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'^(0[1-9]|1[0-2])\/(\d{2})$').hasMatch(value)) {
                    return 'Please enter a valid expiry date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // CVV
              TextFormField(
                controller: _cvvController,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                maxLength: 3,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 3) {
                    return 'Please enter a valid CVV';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),

              // Pay Now Button
              PrimaryButton(
                onPressed: () {
                  _processPayment(cartProvider.cart);
                  cartProvider.cart.clear();
                },
                text: 'Pay Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaymentPage(),
  ));
}
