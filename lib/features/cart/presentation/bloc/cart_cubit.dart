import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_app/features/cart/domain/entities/cart_item.dart';
import 'package:reco_app/features/menu/data/models/food_item.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  void addToCart(FoodItem item) {
    final existing = state.items.indexWhere((e) => e.item.name == item.name);
    if (existing != -1) {
      final updated = [...state.items];
      updated[existing].quantity++;
      emit(state.copyWith(items: updated));
    } else {
      emit(state.copyWith(items: [...state.items, CartItem(item: item)]));
    }
  }

  void removeFromCart(FoodItem item) {
    final updated = state.items.where((e) => e.item.name != item.name).toList();
    emit(state.copyWith(items: updated));
  }

  void clearCart() {
    emit(CartState.initial());
  }
}
