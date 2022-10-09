import 'package:get/get.dart';
import 'package:flutter/material.dart';
class CounterController extends GetxController{
  var _counter=0.obs;

  int setCounter(){
    return _counter.value;
  }

  void setNewCounter(newCounter){
    _counter.value=newCounter;
  }

  get counter=>_counter.value;
  set counter(newValue)=>_counter.value=newValue;

  void increase(){
    counter+=1;
    Get.snackbar("Değer Arttırıldı", "değer: $counter",backgroundColor: Colors.green, duration: Duration(seconds: 3));
  }
  void decrease(){
    counter-=1;
    Get.snackbar("Değer Azaltıldı", "değer: $counter",backgroundColor: Colors.yellowAccent, duration: Duration(seconds: 3));
  }


}