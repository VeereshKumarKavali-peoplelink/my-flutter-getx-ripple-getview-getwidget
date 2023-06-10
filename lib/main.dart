import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_ripple_getview_getwidget/count_controller.dart';

void main() {
  runApp(MyApp());
}

/*
//GetView 
//========
If we have single controller as a dependency then we can use GetView,  
instead of Statelesswidget and avoid writing Get.find 

//GetWidget 
//=========
It is Similar to GetView with one difference, it gives  the same instance of Get.find everytime . It becomes very useful when used in combination with Get.create 
*/



class MyApp extends GetWidget<CountController> {
    MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    //Get.put(CountController());
    Get.create(()=> CountController());

    return GetMaterialApp(
      title: 'GetView & GetWidget',
      theme: ThemeData(primarySwatch: Colors.green,),
      home: Scaffold(
        appBar: AppBar(title: const Text("GetView & GetWidget")),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text("The value is ${controller.count}", style: const TextStyle(fontSize: 25.0))),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: (){
              print(controller.hashCode);
              controller.increment();
            }, child: const Text("increment"))
          ],
        ))
      ),
    );
  }
}
