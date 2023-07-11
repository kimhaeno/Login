import 'package:flutter/cupertino.dart';

enum WearType {
  top, pants, shoes, outer, accessory, hat
  }

class WearInfo {
  late Enum wearType;
  late String brandName;
  late String wearName;

  WearInfo ({required Enum wearType,  required String brandName, required String wearName}){
    this.wearType = wearType;
    this.brandName = brandName;
    this.wearName = wearName;
  }

}