import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/filters';

  final Function onSaveFilters;
  final Map<String, bool> filters;

  const FiltersScreen({
    @required this.filters,
    this.onSaveFilters,
  });

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['glutenFree'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactoseFree'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.onSaveFilters({
              'glutenFree': _glutenFree,
              'lactoseFree': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            }),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  title: Text('Gluten-free'),
                  subtitle: Text('Only include gluten-free meals.'),
                  onChanged: (value) => setState(() => _glutenFree = value),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  title: Text('Vegetarian'),
                  subtitle: Text('Only include vegetarian meals.'),
                  onChanged: (value) => setState(() => _vegetarian = value),
                ),
                SwitchListTile(
                  value: _vegan,
                  title: Text('Vegan'),
                  subtitle: Text('Only include vegan meals.'),
                  onChanged: (value) => setState(() => _vegan = value),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  title: Text('Lactose-free'),
                  subtitle: Text('Only include lactose-free meals.'),
                  onChanged: (value) => setState(() => _lactoseFree = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
