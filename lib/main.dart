import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_managment/Controlller/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    CounterController _controller=Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("You Have Clicked The Button",style: TextStyle(fontSize: 32),textAlign: TextAlign.center,),
            Obx(() => Text(_controller.counter.toString(),
              style: const TextStyle(fontSize: 32),),),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: (){
            _controller.increase();
            print(_controller.counter);
          }, child: const Icon(Icons.add),),
          FloatingActionButton(
            heroTag: "2",
            onPressed: (){
            _controller.decrease();
            print(_controller.counter);
          },child: const Icon(Icons.remove),),
          FloatingActionButton(
            heroTag: "3",
            onPressed: (){
            Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },child: const Icon(Icons.change_circle),),
          FloatingActionButton(
            heroTag: "4",
            onPressed: (){
            Get.to(NewPage());
          },
          child: const Icon(Icons.new_label_sharp),
          )
        ],
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Get.back();
          }, child: Text("Go Back"))
        ],
      ),
    );
  }
}

