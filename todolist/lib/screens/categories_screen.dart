import 'package:flutter/material.dart';
import 'package:todolist/screens/home_screen.dart';
import 'package:todolist/services/category_service.dart';
import '../models/category.dart';

class CategoriesScreen extends StatefulWidget {


  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController =TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService= CategoryService();

  List<Category> _categoryList = <Category>[];

  @override
  void initSate(){
    super.initState();
    getAllCategories();

  }

  getAllCategories()async{
   _categoryList = <Category>[];
    var categories = await _categoryService.readCategories();
    categories.forEach((category){
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        categoryModel.id =category['id'];
        _categoryList.add(categoryModel);
      });
    });
  }

  _showFormDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        actions: <Widget>[
          ElevatedButton(
              onPressed: ()=> Navigator.pop(context),
              child: Text('Cancel')
          ),
          ElevatedButton(
              onPressed: () async{
                _category.name = _categoryNameController.text;
                _category.description= _categoryDescriptionController.text;

               var result =  await _categoryService.saveCategory(_category);
               print(result);

              },

              child: Text('Save')
          ),
        ],
        title: Text('Categories Form'),
        content: SingleChildScrollView(
         child: Column(
           children: <Widget> [
             TextField(
               controller: _categoryNameController,
               decoration: InputDecoration(
                   hintText: 'Write a category',
                   labelText: 'Category'
               ),
             ),
            TextField(
              controller: _categoryDescriptionController,
                decoration: InputDecoration(
                 hintText: 'Write a description',
                  labelText: 'Description'
                ),
            )
           ],
         ),
        ),
      );
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed:() => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          child: Icon(Icons.arrow_back, color: Colors.white,),

        ),
        title: Text('Categories'),
      ),
     body: ListView.builder(
         itemCount: _categoryList.length, itemBuilder: (context, index){
           return Card(
             child: ListTile(
               leading: IconButton(icon: Icon(Icons.edit), onPressed: (){}),
               title: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                 children: <Widget>[
                   Text(_categoryList[index].name),
                   IconButton(
                       icon:Icon(
                         Icons.delete,
                         color: Colors.red,
                       ),
                       onPressed: (){} )
                 ],
               ),
             ),

           );


     }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}
