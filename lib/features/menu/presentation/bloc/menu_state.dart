import 'package:reco_app/features/menu/data/models/food_item.dart';

abstract class MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<FoodItem> items;

  MenuLoaded(this.items);
}

class MenuError extends MenuState {
  final String message;

  MenuError(this.message);
}
