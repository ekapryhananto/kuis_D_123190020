import 'package:flutter/material.dart';
import 'package:kuis/app_store.dart';

class DetailApp extends StatelessWidget {
  final AppStore place;

  DetailApp({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              Image.asset(place.imageLogo),
              SafeArea(child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                      },
                      ),
                    ),
                  ],
                ),
              ))
            ],),
            Container(
              margin: EdgeInsets.only(top: 14),
              child: Text(place.name),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 14),
              child: Text(place.developer),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 14),
              child: Text(place.genre),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 14),
              child: Text(place.description),
            )
          ],
        ),
      ),
    );
  }
}
