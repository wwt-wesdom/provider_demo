import 'package:flutter/material.dart';
import 'package:provider_demo/provider_one.dart';
import 'package:provider/provider.dart';

class FirstPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('first page rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Consumer2<CounterModel,int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
            child: Text(
              'Value: ${counter.value}',
              style: TextStyle(
                fontSize: textSize.toDouble(),
              ),
            )
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
