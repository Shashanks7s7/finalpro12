import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary);
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width / 0.2,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('form');
            },
            child: Card(
              color: Theme.of(context).accentColor,
              child: Stack(
                children: [
                  Center(
                      child: Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 50,
                  )),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: FittedBox(
                        child: Text(
                      'Register your child',
                      style: textStyle,
                    )),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('immunedetail');
            },
            child: Card(
              color: Theme.of(context).accentColor,
              child: Stack(
                children: [
                  Center(
                      child: Icon(
                    Icons.health_and_safety,
                    color: Colors.white,
                    size: 50,
                  )),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Immunization',
                      style: textStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('covid');
            },
            child: Card(
              color: Theme.of(context).accentColor,
              child: Stack(
                children: [
                  Center(
                      child: Icon(
                    Icons.update,
                    color: Colors.white,
                    size: 50,
                  )),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Covid Update',
                      style: textStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('map'),
            child: Card(
              color: Theme.of(context).accentColor,
              child: Stack(
                children: [
                  Center(
                      child: Icon(
                    Icons.local_hospital_rounded,
                    color: Colors.white,
                    size: 50,
                  )),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Hospitals Info',
                      style: textStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
