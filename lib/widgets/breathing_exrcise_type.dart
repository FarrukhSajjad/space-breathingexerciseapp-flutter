import 'package:flutter/material.dart';
import 'package:space/admob_services.dart';

class BreathingExerciseType extends StatelessWidget {
  final String name;
  final String image;
  final String time;
  final String index;
  BreathingExerciseType({this.name, this.image, this.time, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/breathing-screen', arguments: {
          'name': name,
          'image': image,
          'time': time,
          'indexX': index
        }).then((value) => AdmobServices().hideBanner());
      },
      child: Container(
        margin: EdgeInsets.only(right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 240,
                width: 220,
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              '$time minutes',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
