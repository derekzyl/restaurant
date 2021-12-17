import 'package:flutter/material.dart';
import 'package:fluttery/screen/meal_detail_screen.dart';
import 'package:fluttery/screen/tabs_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'screen/categories_screen.dart';
import 'screen/category_meals_screen.dart';
import 'screen/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<dynamic, dynamic> _filter ={
   'gluten': false,
   'lactose': false,
   'vegan': false,
   'vegetarian': false
  };
List<Meal> _availableMeals = DUMMY_MEALS;
List<Meal> _favorite =[];
  void _setFilters(Map<String, bool> filterdata){
setState(() {
   _filter = filterdata;
  _availableMeals = DUMMY_MEALS.where((meal){
    if (_filter['gluten'] && !meal.isGlutenFree){
      return false;
    }
    if (_filter['lactose'] && !meal.isLactoseFree){
      return false;
    }
    if (_filter['vegan'] && !meal.isVegan){
      return false;
    }
    if (_filter['vegetarian'] && !meal.isVegetarian){
      return false;
    }
return true;
  }).toList();
});
  }

  void toggleFav (dynamic mealId){
final existingIndex = _favorite.indexWhere((meal)=> meal.id == mealId );
if (existingIndex >= 0){
  setState((){
    _favorite.removeAt(existingIndex);
  }
  );

}
else{
  setState((){
    _favorite.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
  });

}
  }

  bool _isMealFavorite(dynamic id){
return _favorite.any((element) => element.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'restaurant app ',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
          accentColor: Colors.orange,
        canvasColor: Color.fromRGBO(210, 211, 224, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color:Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color:Color.fromRGBO(20, 51, 51, 1),),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold

            )
 ),),
      // home: TabScreen(),
initialRoute: '/',
      routes: {
        '/':(ctx)=> TabScreen(favorite:_favorite),
        // CategoriesScreen.routeName :(ctx)=>CategoriesScreen(),
        CategoryMealScreen.routeName: (ctx)=> CategoryMealScreen(
            avail :_availableMeals),
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(
          toggleFavorite : toggleFav,
          mealFav: _isMealFavorite
        ),
        FiltersScreen.routeName:(ctx)=> FiltersScreen(
          saveFilters: _setFilters,
          currentFilter :_filter,)
      },
      onGenerateRoute: (settings){
// switch(settings){
//   case()
// }
//       if(settings.name == '/routename'){
//         return ...;
//       }
        return MaterialPageRoute(builder: (context){
          return CategoriesScreen();
        });
      },
      onUnknownRoute: (settings){
        // this gives the  404 page route
        return MaterialPageRoute(builder: (context){
          return CategoriesScreen();
        });

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'restaurant',
            ),

          ],
        ),
      ),
    );
  }
}
