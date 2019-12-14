import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class BabyLinenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BabyLinenPageState();
}

class BabyLinenPageState extends State<BabyLinenPage> {

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.insert_chart,
                    color: Colors.white,
                  ),
                  onPressed: () {

                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Baby Linen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.asset(
                  'images/babyLinenTedy.jpeg',
                  width: screenWidth,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _babyLinenList(),
      ),
    );
  }

  List<Product> data = [Product(1, "Product 1", "Category 1"),
                        Product(2, "Product 2", "Category 2"),
                        Product(3, "Product 3", "Category 3"),
                        Product(4, "Product 4", "Category 4"),
                        Product(5, "Product 5", "Category 5"),
                        Product(6, "Product 6", "Category 6"),
                        Product(7, "Product 7", "Category 7"),
                        ];

  _onReorder(int oldindex, int newIndex) {
    setState(() {
      print("reorder");
      if(newIndex > oldindex) {
        newIndex -= 1;
      }
      var x = data.removeAt(oldindex);
      data.insert(newIndex, x);
    });
  }

  _babyLinenList() {
    return ReorderableListView(
      children: data.map((product) =>
          _buildListItem(product)
      ).toList(),
      onReorder: _onReorder,
    );
  }

  ListTile _buildListItem(product) {
    return ListTile(
      leading: CircularCheckBox(
        activeColor: Theme.of(context).primaryColorDark,
        value: product.getStatus(),
        materialTapTargetSize: MaterialTapTargetSize.padded,
        onChanged: (bool x) {
          setState(() =>  product.invertStatus());
        },
      ),
      key: ObjectKey(product.name),
      title: Text("${product.name}"),
      subtitle: Text('${product.category}'),
      trailing: IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {
        },
      ),
//      onTap: () {
//        print("TAP");
//        setState(() =>  product.invertStatus());
//      },
    );
  }

}

class Product {
  int id;
  String name;
  String category;
  bool _status = false;

  Product(this.id, this.name, this.category);

  getStatus() {
    return _status;
  }

  invertStatus() {
    _status = !_status;
  }

}