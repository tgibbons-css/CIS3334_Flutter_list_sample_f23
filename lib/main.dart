import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int _counter = 0;
  List<String> myList = ["One", "Two", "Three", "Four"];

  void _incrementCounter() {
    setState(() {
      _counter++;
      myList.add("ItemA--" + _counter.toString());
      myList.add("ItemB--$_counter");
      print("The list is $myList");
      print("The size of list is ${myList.length}");
      print("The size of list is " + myList.length.toString());
    });
  }

  void removeItem(int position) {
    setState(() {
      myList.removeAt(position);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: myList.length,
        //shrinkWrap: true,
        itemBuilder: (BuildContext context, int position) {
          return buildListTile(position);
        }
    );
  }

  ListTile buildListTile(int position) {
    return ListTile(
          shape: Border(
            top: BorderSide(),
            bottom: BorderSide(),
          ),
          leading:  Icon(Icons.access_time_outlined),
          title: Row(
            children: <Widget>[
              Icon(Icons.airline_seat_recline_normal_rounded),
              Text("Row :" + myList[position]),
            ],
          ),
          onTap: () {
            removeItem(position);
          }
        );
  }
}