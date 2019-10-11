import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/shop_cart_provider.dart';
import 'package:provider_demo/provider_one.dart';

class ShopCartPage extends StatefulWidget {
  @override
  _ShopCartPageState createState() => _ShopCartPageState();
}

class _ShopCartPageState extends State<ShopCartPage> with AutomaticKeepAliveClientMixin{
 /* @override
  void initState() {
    super.initState();
    print('cart init');
  }*/

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('cart rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer(builder: (BuildContext context, ShopCartModel shopCart, _) => CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Consumer2(builder: (BuildContext context, CounterModel counter,int size, _) {
                return Text('Counter:${counter.value}',style: TextStyle(fontSize: size.toDouble()),);
              }),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            return Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: index == 0 ? 0 : 10.0),
              child: Row(
                children: <Widget>[
                  Image.asset(shopCart.shopCartList[index].img,width: 100,),
                  Column(
                    children: <Widget>[
                      Text('$index'),
                      Text(shopCart.shopCartList[index].title),
                      Text('${shopCart.shopCartList[index].count}'),
                      Text('${shopCart.shopCartList[index].price}'),
                      RaisedButton(onPressed: () {
                        shopCart.deleteCartItem(index);
                      },
                      child: Text('删除'),)
                    ],
                  )
                ],
              ),
            );
          },
              childCount: shopCart.shopCartList.length
          ))
        ],
      )),
    );
  }

  // 重写 wantKeepAlive 保持页面当前状态
  @override
  bool get wantKeepAlive => true;
}
/*class ShopCartPage extends StatelessWidget with AutomaticKeepAliveClientMixin {

  @override



  Widget build(BuildContext context) {
    print('cart rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer(builder: (BuildContext context, ShopCartModel shopCart, _) => CustomScrollView(
        slivers: <Widget>[
          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
            return Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: index == 0 ? 0 : 10.0),
              child: Row(
                children: <Widget>[
                  Image.asset(shopCart.shopCartList[index].img,width: 100,),
                  Column(
                    children: <Widget>[
                      Text('$index'),
                      Text(shopCart.shopCartList[index].title),
                      Text('${shopCart.shopCartList[index].count}'),
                      Text('${shopCart.shopCartList[index].price}'),
                    ],
                  )
                ],
              ),
            );
          },
              childCount: shopCart.shopCartList.length
          ))
        ],
      )),
    );
  }
}*/
