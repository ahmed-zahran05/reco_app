import 'package:flutter/material.dart';
import 'package:reco_app/features/cart/domain/entities/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;

  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(item.item.imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(item.item.name),
      subtitle: Text("x${item.quantity}"),
      trailing: Text("${(item.item.price * item.quantity).toStringAsFixed(2)} EGP"),
    );
  }
}
