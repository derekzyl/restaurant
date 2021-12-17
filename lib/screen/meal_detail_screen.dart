 import 'package:flutter/material.dart';

import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final dynamic toggleFavorite;
  final dynamic mealFav;
  const MealDetailScreen({required this.toggleFavorite, required this.mealFav});


  Widget Builders(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
          text,
          style:Theme.of(context).textTheme.subtitle1),
    );

  }

 Widget theList(BuildContext context, Widget Child){
return Container(
  decoration: BoxDecoration(
      color: Colors.white70,
      borderRadius: BorderRadius.circular(10)
  ),
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(10),
  height: 200,
  width: 300,
  child: Child
);
 }



  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
    final selectedMeal= DUMMY_MEALS.firstWhere(
            (meal) => meal.id == routeArgs  );
    return Scaffold(
      appBar: AppBar( title: Text('${selectedMeal.title}'),),
      body:SingleChildScrollView(
        child: Column(

          children: <Widget>[
Container(height:300,
  width: double.infinity,
  child: Image.network(selectedMeal.imageUrl),
),
            Builders(context, 'ingredients'),

            theList(context, ListView.builder(itemBuilder: (ctx, index)=> Card(

              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(selectedMeal.ingredients[index]),
              ),
            ),
              itemCount: selectedMeal.ingredients.length,),),

            Builders(context, 'Steps'),
            theList(context, ListView.builder(itemBuilder: (context, index)=>Column(
              children: [
                ListTile(
                    leading: CircleAvatar(child: Text('# ${(index + 1)}'),),
                title: Text(selectedMeal.steps[index]),),
                Divider()
              ],
            ),
               itemCount: selectedMeal.steps.length,
            ))


          ],
        ),
        // flooatingActionButton:
    //         floatingActionButton: FloatingActionButton(
    // child: Icon(
    // Icons.delete,
    // ),
    // onPressed: () {
    // Navigator.of(context).pop(mealId);
    // },
      ),

    floatingActionButton: FloatingActionButton(
      onPressed: ()=>toggleFavorite(routeArgs),

      child: Icon( mealFav(routeArgs)? Icons.star: Icons.star_border,),
    )
    );
  }
}
