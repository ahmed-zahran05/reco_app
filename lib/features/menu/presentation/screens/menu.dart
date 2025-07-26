import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_app/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:reco_app/features/cart/presentation/screens/cart.dart';
import 'package:reco_app/features/menu/presentation/bloc/menu_cubit.dart';
import 'package:reco_app/features/menu/presentation/bloc/menu_state.dart';
import 'package:reco_app/features/menu/presentation/widgets/food_item_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<CartCubit>(context),
                    child: const CartScreen(),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          if (state is MenuLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MenuLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return FoodItemCard(item: state.items[index]);
              },
            );
          } else if (state is MenuError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}
