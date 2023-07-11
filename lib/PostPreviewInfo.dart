class PostPreviewInfo {
  late String photo;
  late String profile;
  late String name;
  late String date;
  late String body;


  WearInfo ({required Enum wearType,  required String brandName, required String wearName}){
    this.wearType = wearType;
    this.brandName = brandName;
    this.wearName = wearName;
  }

}