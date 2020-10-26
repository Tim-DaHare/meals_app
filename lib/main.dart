import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';

import './data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && filterData['glutenFree']) return false;
        if (!meal.isLactoseFree && filterData['lactoseFree']) return false;
        if (!meal.isVegan && filterData['vegan']) return false;
        if (!meal.isVegetarian && filterData['vegetarian']) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    var isIncluded = _favoriteMeals.contains(meal);

    setState(() {
      if (isIncluded) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool isMealFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favoriteMeals: _favoriteMeals),
        CategoriesScreen.ROUTE_NAME: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.ROUTE_NAME: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MailDetailsScreen.ROUTE_NAME: (ctx) => MailDetailsScreen(
              isMealFavorite: isMealFavorite,
              toggleFavorite: _toggleFavorite,
            ),
        FiltersScreen.ROUTE_NAME: (ctx) => FiltersScreen(
              filters: _filters,
              onSaveFilters: _setFilters,
            ),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
