import 'package:flutter/material.dart';
import 'package:fluttery/widget/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final dynamic saveFilters;
  final Map<dynamic, dynamic>  currentFilter;
  const FiltersScreen({required this.saveFilters, required this.currentFilter});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState(){

     _isGlutenFree = widget.currentFilter['gluten'];
     _isVegan = widget.currentFilter['vegan'];
     _isVegetarian = widget.currentFilter['vegetarian'];
     _isLactoseFree = widget.currentFilter['lactose'];

  super.initState();
  }

  Widget Switches(BuildContext context, bool val, String title, String subTitle,
      dynamic update) {
    return SwitchListTile(
      title: Text(title),
      value: val,
      onChanged: update,
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('filters'),
        actions:<Widget> [
          IconButton(onPressed: () {
            final selectedFilters = {
            'gluten' : _isGlutenFree,
            'vegan': _isVegan,
            'vegetarian' : _isVegetarian,
            'lactose': _isLactoseFree,
            };
            widget.saveFilters(selectedFilters);
          },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('adjust your meal choice',
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Expanded(
            child: ListView(
              children: [
                Switches(
                    context,
                    _isGlutenFree,
                    'Gluten free',
                    'only include gluten free meals',

                        (newval){
                      setState((){
                        _isGlutenFree = newval;
                      });
                    }


                ),
                Switches(context, _isVegan, 'Vegan',
                    'only include vegan  meals', (newval){
                  setState((){
                    _isVegan = newval;
                  });
                  }),
                Switches(
                    context,
                    _isVegetarian,
                    'vegetarian',
                    'only include vegetarian meals',

                        (newval){
                      setState((){
                        _isVegetarian = newval;
                      });
                    }

                ),
                Switches(
                    context,
                    _isLactoseFree,
                    'Lactose free',
                    'only include lactose free meals',
                      (newval){
                setState((){
                _isLactoseFree = newval;
                });
                }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
