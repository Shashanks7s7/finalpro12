import 'package:finallygod/Modals/vacination.dart';
import 'package:finallygod/widgets/piechart.dart';
import 'package:flutter/material.dart';

class DiseaseDetails extends StatefulWidget {
  Vaccination vac;
  DiseaseDetails(this.vac);

  @override
  _DiseaseDetailsState createState() => _DiseaseDetailsState();
}

class _DiseaseDetailsState extends State<DiseaseDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vac.vaccine),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: size.height / 4,
            width: double.infinity,
            child: Image.asset(
              widget.vac.file,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.vac.vaccine,
              style: textStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Brands: ${widget.vac.brandname}",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          SizedBox(height: size.height / 35),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                PieChart(widget.vac.safe),
                Text(
                  "Safe",
                  style: TextStyle(color: Colors.grey[700]),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time to Vaccinne',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                for (int i = 0; i < widget.vac.time.length; i++)
                  Row(
                    children: [
                      Icon(Icons.date_range),
                      Text(
                        widget.vac.time[i],
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
              ],
            )
          ]),
          SizedBox(height: size.height / 22),
          Center(
            child: Text(
              "What Its For",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey, width: 2)),
            child: Text(
              widget.vac.whatfor,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                    child: Text("Common Side Effects    ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800))),
                FittedBox(
                    child: Text("Consult your doctor if",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800)))
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: size.width / 2.8,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Text(
                    widget.vac.sideeffects,
                    textAlign: TextAlign.center,
                  )),
              Container(
                  width: size.width / 1.8,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Text(
                    widget.vac.worstcase,
                    textAlign: TextAlign.center,
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
