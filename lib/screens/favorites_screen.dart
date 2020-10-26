import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isNotEmpty) {
      return Center(
        child: ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, i) {
            return MealItem(
              meal: favoriteMeals[i],
            );
          },
        ),
      );
    } else {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }
  }
}
