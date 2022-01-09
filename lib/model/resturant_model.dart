class ResturantModel{
   String paymentUrl="" ;
   String address="";
   String imageUrl="";
   String name="";
   String phone="";
    String resturantId="";

  ResturantModel({ required this.paymentUrl,required this.name,required this.address,required this.imageUrl,required this.phone,required this.resturantId});

  ResturantModel.fromJson(Map<String,dynamic> json){

    paymentUrl=json['paymentUrl'];
    address=json['address'];
    imageUrl=json['imageUrl'];
    name=json['name'];
    phone=json['phone'];
  //  resturantId=json['resturantId'];

  }
Map<String,dynamic> tojson(){
    var data =Map<String,dynamic>();
    data['paymentUrl']=this.paymentUrl;
    data['address']=this.address;
    data['imageUrl']=this.imageUrl;
    data['name']=this.name;
    data['phone']=this.phone;
   // data['resturantId']=this.resturantId;

return data;
}

}