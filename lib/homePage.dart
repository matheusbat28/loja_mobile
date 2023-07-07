import 'package:flutter/material.dart';
import 'package:loja/apis.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  // Lista de páginas/telas para exibir no menu
  final List<Widget> _pages = [
    // Coloque as páginas/telas desejadas aqui
    Home(),
    Categoria(),
    Favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopfinity'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body:
          _pages[_currentIndex], // Página atual com base no índice selecionado
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Índice da página atual
        onTap: (int index) {
          setState(() {
            _currentIndex =
                index; // Atualizar o índice quando uma nova página for selecionada
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
        ],
        selectedItemColor: Colors.purple, // Define a cor dos itens selecionados
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _search = TextEditingController();
  String value_search = 'Laptop';
  List<dynamic> dados = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    getProducts(value_search).then((response) {
      setState(() {
        dados = response['products'];
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0,
                      3), // Define o deslocamento horizontal e vertical da sombra
                ),
              ],
            ),
            child: TextField(
              controller: _search,
              onChanged: (value) {
                setState(() {
                  value_search = value;
                  fetchData();
                });
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.deepPurple),
                hintText: 'Pesquisar',
                hintStyle: TextStyle(color: Colors.deepPurple),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Colors.deepPurple,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            )),
        Container(
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.only(top: 10),
          child: Image.network(
            'https://img.freepik.com/vetores-gratis/banner-moderno-de-liquidacao-na-sexta-feira-preta-no-estilo-de-memphis_1017-34722.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: 130,
          margin: EdgeInsets.only(top: 25, bottom: 20),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 30,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Categorias',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    print('smartphones');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Smartphone_icon_-_Noun_Project_283536_white.svg/1024px-Smartphone_icon_-_Noun_Project_283536_white.svg.png',
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0,
                              3), // Define o deslocamento horizontal e vertical da sombra
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('automotive');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      'https://icon-library.com/images/car-icon-white/car-icon-white-8.jpg',
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0,
                              3), // Define o deslocamento horizontal e vertical da sombra
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('furniture');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      'https://icon-library.com/images/armchair-icon/armchair-icon-6.jpg',
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0,
                              3), // Define o deslocamento horizontal e vertical da sombra
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('lighting');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                      'https://flaticons.net/icon.php?slug_category=gadgets&slug_icon=light-bulb',
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.deepPurple,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0,
                              3), // Define o deslocamento horizontal e vertical da sombra
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        Expanded(
          child: GestureDetector(
            child: ListView.builder(
              itemCount: dados.length, // Número de itens na lista
              itemBuilder: (context, index) {
                final products = dados[index];
                return ListTile(
                  title: Text(products['title']),
                  trailing: Icon(Icons.description_outlined),
                  leading: Image.network(
                    products['thumbnail'],
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class Categoria extends StatefulWidget {
  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  List<dynamic> dados = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    getCategories().then((response) {
      setState(() {
        dados = response['categories'] as List<dynamic>;
        print(dados);
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: ListView.builder(
          itemCount: dados.length, // Número de itens na lista
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dados[index]),
              trailing: Icon(Icons.open_in_new),
            );
          },
        ),
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container());
  }
}
