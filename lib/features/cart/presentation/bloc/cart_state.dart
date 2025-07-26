import 'package:reco_app/features/cart/domain/entities/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  factory CartState.initial() => CartState(items: []);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  double get totalPrice =>
      items.fold(0, (sum, e) => sum + (e.item.price * e.quantity));
}
