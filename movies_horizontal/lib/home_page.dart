import 'package:flutter/material.dart';
import 'package:movies_horizontal/item_movie.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _listElements = [
    {
      "title": "Star wars",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/tpHc9cS.jpg",
    },
    {
      "title": "Black widow",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/0NTTbFn.jpg",
    },
    {
      "title": "Frozen 2",
      "description": "Ranking: ★★★",
      "image": "https://i.imgur.com/noNCN3V.jpg",
    },
    {
      "title": "Joker",
      "description": "Ranking: ★★★★",
      "image": "https://i.imgur.com/trdzMAl.jpg",
    },
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Column(
        children: [
          Text('Selecciona tu pelicula'),
          SizedBox(height: 24),
          Container(
            height: 350,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _listElements.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Selección Guardada'),
                        content: Text(
                            'Se ha seleccionado: ${_listElements[index]['title']}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          )
                        ],
                      ),
                    );
                  },
                  child: ItemMovie(
                    titulo: _listElements[index]['title']!,
                    descripcion: _listElements[index]['description']!,
                    imagen: _listElements[index]['image']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
