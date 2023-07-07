import 'package:flutter/material.dart';
import 'package:loja/apis.dart';

class ViewProductsInCategory extends StatefulWidget {
  final String category;
  const ViewProductsInCategory({Key? key, required this.category})
      : super(key: key);

  @override
  State<ViewProductsInCategory> createState() => _ViewProductsInCategoryState();
}

class _ViewProductsInCategoryState extends State<ViewProductsInCategory> {
  List<dynamic> dados = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    getProductInCategory(widget.category).then((response) {
      setState(() {
        dados = response['category'] as List<dynamic>;
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: dados.length, // Número de itens na lista
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ViewProductsInCategory(category: dados[index])));
              },
              child: ListTile(
                title: Text(dados[index]),
                trailing: Icon(Icons.open_in_new),
                leading: Icon(Icons.category_outlined),
              ),
            );
          },
        ),
      ),
    );
  }
}
