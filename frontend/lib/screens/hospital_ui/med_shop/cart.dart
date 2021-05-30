/*
Author :
Chaitanya Hardikar
NIT Warangal
*/

import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Amazon Shopping Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            SizedBox(height: 18.0),
            CartItem(),
            CartItem2(),
            CartItem3(),
            CartItem4(),
            SizedBox(height: 18.0),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "\u20b9 1500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Delivery Charges",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "\u20b9 100",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sub Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "\u20b9 1600",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {},
              color: Colors.cyan,
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "PROCEED TO CHECKOUT ON AMAZON",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key key,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int value = 1;
  void add() {
    setState(() {
      value++;
    });
  }

  void minus() {
    setState(() {
      if (value != 0) value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                        "https://images-na.ssl-images-amazon.com/images/I/316d%2Bh7MTyL.jpg"),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Text(
                    "PPE Kit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: minus,
                        child: new Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: add,
                        child: new Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\u20b9 500",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//2
class CartItem2 extends StatefulWidget {
  const CartItem2({
    Key key,
  }) : super(key: key);

  @override
  _CartItem2State createState() => _CartItem2State();
}

class _CartItem2State extends State<CartItem2> {
  int value = 1;
  void add() {
    setState(() {
      value++;
    });
  }

  void minus() {
    setState(() {
      if (value != 0) value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                        "https://5.imimg.com/data5/EA/RI/RX/SELLER-27656881/portable-oxygen-cylinders-4l-6l-250x250.jpg"),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Text(
                    "Oxygen Cylinder",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: minus,
                        child: new Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: add,
                        child: new Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\u20b9 300",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//3
class CartItem3 extends StatefulWidget {
  const CartItem3({
    Key key,
  }) : super(key: key);

  @override
  _CartItem3State createState() => _CartItem3State();
}

class _CartItem3State extends State<CartItem3> {
  int value = 5;
  void add() {
    setState(() {
      value++;
    });
  }

  void minus() {
    setState(() {
      if (value != 0) value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                        "https://5.imimg.com/data5/GV/YT/UW/SELLER-2991505/kam-500x500.PNG"),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Text(
                    "N95 Surgical Mask",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: minus,
                        child: new Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: add,
                        child: new Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\u20b9 100",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//4
class CartItem4 extends StatefulWidget {
  const CartItem4({
    Key key,
  }) : super(key: key);

  @override
  _CartItem4State createState() => _CartItem4State();
}

class _CartItem4State extends State<CartItem4> {
  int value = 1;
  void add() {
    setState(() {
      value++;
    });
  }

  void minus() {
    setState(() {
      if (value != 0) value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            padding: EdgeInsets.all(4.0),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                        "data:image/jpeg;base64,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"),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100.0,
                  child: Text(
                    "Oximeter",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: minus,
                        child: new Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: new FloatingActionButton(
                        onPressed: add,
                        child: new Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\u20b9 200",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
