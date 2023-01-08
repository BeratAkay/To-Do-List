class Category{
  int ? id;
      late  String  name ;
      String ? description;




  categoryMap(){
    var mapping= Map<String, dynamic>();
    mapping['name'] = name;
    mapping['description'] = description;
    mapping['id'] =id;


    return mapping;

  }
}