import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_app/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:reco_app/features/menu/data/models/food_item.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem item;

  const FoodItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.asset(
              item.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ListTile(
              title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${item.price.toStringAsFixed(2)} EGP"),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              BlocProvider.of<CartCubit>(context).addToCart(item);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item.name} added to cart")),
              );
            },
          ),
        ],
      ),
    );
  }
}

