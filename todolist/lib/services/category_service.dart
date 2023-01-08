import 'package:todolist/models/category.dart';
import 'package:todolist/repositories/repository.dart';

class CategoryService{
   Repository? _repository;

  CategoryService(){
    _repository = Repository();
  }


  saveCategory(Category category) async{
    return await _repository!.insertData('categories',category.categoryMap());
  }

  readCategories() async{
    return await _repository?.readData('categories');
  }
}