import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Sandwich Counter'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OrderItemDisplay(
            _quantity,
            'Footlong',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => print('Add button pressed!'),
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () => print('Remove button pressed!'),
                child: const Text('Remove'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      width: 300,
      height: 200,
      alignment: Alignment.center,
      child: Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}'),
    );
  }
}
