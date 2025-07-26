import 'package:reco_app/features/menu/data/models/food_item.dart';

class CartItem {
  final FoodItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}
