import 'package:flutter/material.dart';
import 'package:loja/apis.dart';

class ViewProducts extends StatefulWidget {
  final int id;
  final String url_img;

  const ViewProducts({Key? key, required this.id, required this.url_img})
      : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  String name = '';
  String price = '';
  String brand = '';
  String description = '';
  String category = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    getProduct(widget.id).then((response) {
      setState(() {
        name = response['products']['title'];
        price = response['products']['price'].toString();
        brand = response['products']['brand'];
        description = response['products']['description'];
        category = response['products']['category'];
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Image.network(
              widget.url_img,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  '\$ $price.00',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(right: 25),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(description),
          ),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 30),
            child: Text(
              'Infomações',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '   Marca: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    brand,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '   categoria: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    category,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
