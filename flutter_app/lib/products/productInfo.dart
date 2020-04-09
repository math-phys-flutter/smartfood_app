import 'package:flutter/material.dart';
import 'package:flutterapp/registration/shoppingCart.dart';
import 'package:flutterapp/products/productList.dart';
import 'package:flutterapp/registration/cart.dart';
import 'package:provider/provider.dart';
/*void main() => runApp(ProductInfoMain());
class ProductInfoMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      //debugShowCheckedModeBanner: false, // стандарт от Google
      home: ProductInfo(),
    );*/
     return ChangeNotifierProvider<Cart>(
        create: (context){return Cart();},
        child: MaterialApp(
          debugShowCheckedModeBanner: false,  // стандарт от Google
          home: Consumer<Cart> (
            builder: (context,whatever,child) {return ProductInfo();},
            //ProductInfo()
          ),
        )
    );
    /*return ChangeNotifierProvider<Cart>(
      create: (context) => new Cart(),
      child: Consumer<Cart>(
        builder: (context,cart,_)
        { return MaterialApp(
        //debugShowCheckedModeBanner: false, // стандарт от Google
        home: ProductInfo(),
      );}
      )
    );*/
    /*return ChangeNotifierProvider<Cart>.value(
        value: Cart(),
        child: MaterialApp(
          //debugShowCheckedModeBanner: false,  // стандарт от Google
          home: ProductInfo(),
            //ProductInfo()
          ),
        );*/
  }
}*/
class ProductInfo extends StatefulWidget {

  String name,
      brand,
      picture;
  double price ,
      value,
      oldPrice;
  int id, num;
  ProductInfo({ Key key,
    this.name, this.id, this.oldPrice, this.picture,
    this.value, this.price, this.brand, this.num = 0
  }):super(key:key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {


  @override
  Widget build(BuildContext context) {
    //Cart bloc = Provider.of<Cart>(context);
    /*int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }*/
    int totalCount = 0;
    cart.forEach((item){
      totalCount = totalCount + item.num;
    });
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Продукт ' + widget.id.toString()),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ), onPressed: () {}),
            Stack(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ShoppingCart(cart,sum)))
                  ),
                  Positioned(
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.red[700]),
                          Positioned(
                              top: 3.0,
                              right: 7,
                              child: Center(
                                child: Text('$totalCount',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                          ),
                        ],
                      )
                  ),
                ]
            )
          ]
      ),


      body: ListView(
        children: <Widget>[
          Container(
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.network(widget.picture),
                  //child: Text('Цена: ' + widget.price.toString()),
                )),
            height: 300.0,
          ),
          RaisedButton(
            splashColor: Theme.of(context).primaryColor,
            highlightColor: Theme.of(context).primaryColor,
            color: Colors.white,
            child: Text('Добавить в корзину'),
            //style : TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor, fontSize: 20),
            onPressed: () {
              if(cart.contains(widget)){
                widget.num += 1;
              }
              else {
                cart.add(widget); //update
                widget.num = 1;
              }
              sum = 0;
              cart.forEach((item){
                sum = sum + item.num*item.price;

              });
              //var bloc = Provider.of<Cart>(context, listen: false);
              //bloc.addToCart(widget);
            },
          )
        ],
      ),
    );
  }
}