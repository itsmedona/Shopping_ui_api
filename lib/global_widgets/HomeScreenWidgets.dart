import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  final String productName;
  final String company;
  final String image;
  final String price;
  final void Function()? onTap;
  final String Cartimage;
  final String Cartprice;
  final String Carttitle;

  const HomeScreenWidget({
    super.key,
    required this.productName,
    required this.company,
    required this.image,
    required this.price,
    this.onTap,
    required this.Cartimage,
    required this.Cartprice,
    required this.Carttitle,
  });

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  bool whenClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            InkWell(
              onTap: widget.onTap,
              child: Container(
                height: 160,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            //when clicked indicates when clicked turn red and show snackbar else show the other one as well
                            if (whenClicked = !whenClicked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                      content:
                                          Text("item added to favourites")));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyCart(
                                      image: widget.Cartimage,
                                      price: widget.Cartprice,
                                      title: widget.Carttitle,
                                    ),
                                  ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          "item removed from favourites")));
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: whenClicked
                              ? Colors.red
                              : Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.productName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    widget.company,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "\$" + widget.price,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ],
        ));
  }
}