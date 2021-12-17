import 'package:flutter/material.dart';
import 'package:fluttery/models/meal.dart';
import 'package:fluttery/widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favor;
  const FavoritesScreen({required this.favor});

  @override
  Widget build(BuildContext context) {
    if (favor.isEmpty){
      return Center(
        child: Text('empty favorites'),
      );
    }
    else{
    return ListView.builder(
      itemBuilder: (cxt, index) {
        return MealItem(
          id:  favor[index].id,
          title:  favor[index].title,
          afford:  favor[index].afford,
          complexity: favor[index].complexity,
          duration:  favor[index].duration,
          imageUrl: favor[index].imageUrl,

        );
      },
      itemCount:  favor.length,
    );
    }

  }
}
