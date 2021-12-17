import 'package:flutter/material.dart';
import 'package:fluttery/models/meal.dart';
import 'package:fluttery/widget/main_drawer.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favorite;
  const TabScreen({required this.favorite});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

 late List<Map<dynamic, dynamic>> _pagea ;
 int _selectedPageIndex = 0;


 @override
 initState(){
    _pagea = [
      {'page':CategoriesScreen(), 'title': 'category' },
      {'page':FavoritesScreen(favor: widget.favorite), 'title': 'favorites' },

    ];
  }
  // final List<Widget> _pages = [
  //   CategoriesScreen(),
  //   FavoritesScreen()
  // ];

  void _selectPage(int index){
setState(() {
  _selectedPageIndex = index;
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagea[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pagea[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,

        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),
          title: Text('categories'),
            backgroundColor: Theme.of(context).primaryColor
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star),
              title: Text('favorite'),
              backgroundColor: Theme.of(context).primaryColor
          ),

        ],
      ),
    );

    // DefaultTabController(
    //   length: 2,

    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('fluttery'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'favorites',
    //           )
    //         ],
    //       ),
    //     ),
    //     body:TabBarView(children: [
    //       CategoriesScreen(),
    //        FavoritesScreen()
    //     ],) ,
    //   ));
  }
}
