import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _prima = 0;
  String _keterangan = "";
  String _text = "Ganjil : ";
  String _text2 = "Genap Kelipatan 3 : ";
  String _text3 = "Prima : ";
  String _text4 = "Genap : ";


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      // if (_counter > 10) {
      //   _counter = 0;
      // }

      _text = "Ganjil : ";
      _text2 = "Genap Kelipatan 3 : ";
      _text3 = "Prima : ";
      _text4 = "Genap : ";
      for(int i = 1; i <= _counter; i++){
         if(i%2 != 0){
          _text += '${i}, ';
          _keterangan = "Ganjil";
        }else if(i%2 == 0 ){
           _text4 += '${i}, ';
           _keterangan = "Genap";
           if(i%3 == 0){
             _text2 += '${i}, ';
             _keterangan += " dan kelipatan 3";
           }
         }

        _prima = 0;
        for(int j = 1; j < i; j++){
            if(i%j == 0){
              _prima++;
            }
        }
        if(_prima == 1){
            _text3 += '${i}, ';
            _keterangan += " dan Prima";
        }
      }
    });
  }

  void _reset(){
    setState(() {
      _counter = 0;
      _text = "Ganjil : ";
      _text2 = "Genap Kelipatan 3 : ";
      _text3 = "Prima : ";
      _text4 = "Genap : ";
      _keterangan = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_keterangan',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 20),
            Text(
              _text,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              _text4,
              style: Theme.of(context).textTheme.headline6,

            ),
            Text(
              _text2,
              style: Theme.of(context).textTheme.headline6,

            ),
            Text(
              _text3,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),

            ),
            FloatingActionButton(
              onPressed: _reset,
              tooltip: 'Reset',
              child: const Icon(Icons.delete),
            ),
          ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
