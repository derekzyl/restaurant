import 'package:flutter/material.dart';
import 'package:fluttery/widget/meal_item.dart';
import '../models/meal.dart';


class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
final  List<Meal> avail;

CategoryMealScreen({required this.avail});
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
 dynamic categoryTitle;
 dynamic displayedMeals;
var _loadedData = false;
  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedData){
      final routeArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.avail.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
    }

   _loadedData= true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
setState(() {
  displayedMeals.removeWhere((element) => element.id==mealId);
});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, index) {
          return MealItem(
            id:  displayedMeals[index].id,
            title:  displayedMeals[index].title,
            afford:  displayedMeals[index].afford,
            complexity: displayedMeals[index].complexity,
            duration:  displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,

          );
        },
        itemCount:  displayedMeals.length,
      ),
    );
  }
}
