import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/category_meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen({this.availableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> displayedMeals;
  var _initializedData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initializedData) return;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Category>;

    category = routeArgs['category'];
    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(routeArgs['category'].id))
        .toList();

    _initializedData = true;
  }

  void _hideMeal(Meal meal) {
    setState(() {
      displayedMeals.remove(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            meal: displayedMeals[i],
          );
        },
      ),
    );
  }
}
