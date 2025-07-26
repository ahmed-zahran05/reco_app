import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_app/core/utils/images.dart';
import 'package:reco_app/features/menu/data/models/food_item.dart';
import 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuLoading()) {
    loadMenuItems();
  }

  void loadMenuItems() {
    emit(MenuLoading());

    final items = [
      FoodItem(name: "Burger", price: 45.0, imagePath: AppImages.burger),
      FoodItem(name: "Pizza", price: 80.0, imagePath:  AppImages.pizza ),
      FoodItem(name: "Pasta", price: 60.0, imagePath:  AppImages.pasta),
      FoodItem(name: "Salad", price: 35.0, imagePath:  AppImages.salad),
      FoodItem(name: "Burger", price: 45.0, imagePath: AppImages.burger),
      FoodItem(name: "Pizza", price: 80.0, imagePath:  AppImages.pizza ),
      FoodItem(name: "Pasta", price: 60.0, imagePath:  AppImages.pasta),
      FoodItem(name: "Salad", price: 35.0, imagePath:  AppImages.salad),
    ];

    emit(MenuLoaded(items));
  }
}
