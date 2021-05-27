import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';


class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(this.currentFilter, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _vegeterian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    _lactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  Widget _buildSwiftListTile(
    String title, 
    String description, 
    bool currValue, 
    Function replaceValue,
  ) {
    return SwitchListTile(
              title: Text(title), 
              value: currValue,
              subtitle:Text(
                description,
              ),
              onChanged: replaceValue,
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your filters'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegeterian,
              };
              widget.saveFilters(_filters);
            },
          )
        ],
        ),
      drawer: MainDrawer(),
      body:Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust meal selection',
            style: Theme.of(context).textTheme.headline6,
            ),
        ),
        Expanded(child: ListView(
          children: <Widget> [
              _buildSwiftListTile(
              'Gluten-free', 
              'Only include gluten-free meals', 
              _glutenFree, 
              (newValue) {
                setState(
                  () {
                  _glutenFree = newValue;
                  },
                  );
              },
              ),
              _buildSwiftListTile(
              'Lactose-free', 
              'Only include lactose-free meals', 
              _lactoseFree, 
              (newValue) {
                setState(
                  () {
                  _lactoseFree = newValue;
                  },
                  );
              },
              ),
              _buildSwiftListTile(
              'Vegetarian', 
              'Only include vegetarian meals', 
              _vegeterian, 
              (newValue) {
                setState(
                  () {
                  _vegeterian = newValue;
                  },
                  );
              },
              ),
              _buildSwiftListTile(
              'Vegan', 
              'Only include vegan meals', 
              _vegan, 
              (newValue) {
                setState(
                  () {
                  _vegan = newValue;
                  },
                  );
              },
              )
        ],
        )
        ),
      ],
      ),
    );
  }
}