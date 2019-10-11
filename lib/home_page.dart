import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider_one.dart';
import 'package:provider_demo/second_page.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
//    final _counter = Provider.of<CounterModel>(context);
//    final textSize = Provider.of<int>(context);
    /// Provider.of() 当监听的数据变化的时候 build 方法会重新调用，而 Consumer方法只会重新build使用的部分
    print('home page rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Consumer2(builder: (BuildContext context, CounterModel counter, int textSize, _) {
          return Column(
            children: <Widget>[
              Text(
                'Value:${counter.value}',
                style: TextStyle(fontSize: textSize.toDouble()),
              ),
              RaisedButton(onPressed: () {
                counter.increment();
              },child: Icon(Icons.add),)
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondPage())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
