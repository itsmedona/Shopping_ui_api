import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(
      {super.key,
      required this.description,
      required this.image,
      required this.title,
      required this.price,
      required this.rating,
      required this.brand});
  final String description;
  final String image;
  final String title;
  final String price;
  final String rating;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    width: 230,
                    child: Text(
                      textAlign: TextAlign.justify,
                      title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Text(
                    brand,
                    style: TextStyle(fontSize: 19, color:Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + price,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        rating,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Buy Now",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}