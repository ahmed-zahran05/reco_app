import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_app/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:reco_app/features/cart/presentation/bloc/cart_state.dart';
import 'package:reco_app/features/cart/presentation/widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text("Cart is empty"));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) =>
                      CartItemTile(item: state.items[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Total: ${state.totalPrice.toStringAsFixed(2)} EGP",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
