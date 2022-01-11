import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class NoticeView extends StatefulWidget {


  
   NoticeView({ Key? key }) : super(key: key);

  @override
  _NoticeViewState createState() => _NoticeViewState();
}
final List<String> imgList = [
  'assets/images/1.jpg',
  'assets/images/3.jpg',
  'assets/images/hehe.jpg',
  'assets/images/4.jpg',
  'assets/images/5.jpg',
   'assets/images/12.jpg',

];

final List<Widget> imageSliders =/*imageList.map((item) => Image.asset(item,fit: BoxFit.cover,width: 1000,)
           )

          .toList();*/ imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
class _NoticeViewState extends State<NoticeView> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      
        height: 160,
        width: double.infinity,

        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 2)
            
        ),
        child: CarouselSlider(
          items:imageSliders,

  

         
          options: CarouselOptions(autoPlay: true,
          aspectRatio: 2,
          
          enlargeCenterPage: true,
          
          ),
          )
        
          );
  }
}