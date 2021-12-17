import 'package:flutter/material.dart';

import '../widget/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  // static const routeName = '/';

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: GridView(padding: EdgeInsets.all(15),
        children:DUMMY.map((data){
        
      return CategoryItem(color: data.color, title: data.title, id: data.id ,);
    } ).toList(),
      gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,),
    ),);

  }
}
