import 'package:flutter/material.dart';

class ItemMovie extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String imagen;

  ItemMovie({
    super.key,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 250,
      width: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "$imagen",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(175, 197, 205, 240),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$titulo',
                    ),
                    Text('$descripcion'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
