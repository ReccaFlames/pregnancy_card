import 'package:flutter/material.dart';
import 'package:pregnancy_card/baby_linen/product.dart';

class ProductDetailsPage extends StatefulWidget {

  final Product product;

  ProductDetailsPage(this.product);

  @override
  State<StatefulWidget> createState() => ProductDetailsPageState(product);
}

class ProductDetailsPageState extends State<ProductDetailsPage> {

  final Product product;

  ProductDetailsPageState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: PageView(
              children: <Widget>[
                Image.network(
                    "https://luxloungeefr.com/wp-content/uploads/2015/03/blue-custom.png"),
                Image.network(
                    "https://luxloungeefr.com/wp-content/uploads/2015/03/blue-custom.png"),
                Image.network(
                    "https://luxloungeefr.com/wp-content/uploads/2015/03/blue-custom.png"),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
             children: <Widget>[
               _productPageBody(),
               RaisedButton(
                 shape: new RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(18.0),
                 ),
                 color: Theme.of(context).primaryColorDark,
                 elevation: 5,
                 child: Text(
                   'Order now',
                   style: TextStyle(
                     color: Colors.white
                   ),
                 ),
                 onPressed: () {},
               )
             ],
            ),
          ),
        ],
      ),
    );
  }

  bool _checked = false;

  _productPageBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  product.getName(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: _checked ? Icon(Icons.check_circle_outline, color: Colors.lightGreen,) :Icon(Icons.add_circle_outline),
                  iconSize: 30,
                  onPressed: () {
                    setState(() {
                      _checked = !_checked;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

}