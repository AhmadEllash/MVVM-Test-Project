
class SliderObject {
  String title;
  String subTitle;
  String imagePath;
  SliderObject(
      {required this.title, required this.subTitle, required this.imagePath});
}
class SliderViewObject {
  SliderObject sliderObject;
  int numOfSliders;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSliders, this.currentIndex);

}
class Customer{
  int id;
  String name;
  Customer(this.id,this.name);
}
class Contact{
  String phone;
  String email;
  Contact(this.email,this
  .phone);
}

class Authentication{
  Customer? customer;
  Contact ?contact;
  Authentication(this.customer,this.contact);
}