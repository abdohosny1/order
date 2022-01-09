class PopularItemModel{
  late String food_id;
  late String image;
  late String menu_id;
  late String name;

  PopularItemModel({required this.name,required this.image,required this.food_id,required this.menu_id});

  PopularItemModel.fromJson(Map<String,dynamic> json){
    food_id=json['food_id']== null ?'' :json['food_id'];
    image=json['image']== null ?'' :json['image'];
    menu_id=json['menu_id']== null ?'' :json['menu_id'];
    name=json['name']== null ?'' :json['name'];
  }

  Map<String,dynamic> tojson(){
    var data=Map<String,dynamic>();
    data['food_id']=this.food_id;
    data['image']=this.image;
    data['menu_id']=this.menu_id;
    data['name']=this.name;

    return data;
  }
}