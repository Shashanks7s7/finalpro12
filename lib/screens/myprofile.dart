import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/Modals/childdb.dart';
import 'package:finallygod/Modals/mydatabase.dart';
import 'package:finallygod/Modals/vaccinedb.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final user = FirebaseAuth.instance.currentUser;

  bool loading = false;

  getimage(String childimage) async {
    final user = FirebaseAuth.instance.currentUser;
    final data = await FirebaseFirestore.instance
        .collection('registration')
        .doc(user!.uid)
        .get();

    return childimage = data['childimage'];
  }

  getDataaa() async {
    final user = FirebaseAuth.instance.currentUser;
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    return data;
  }

  List childlist = [];
  childdata() {
    List itemlist = [];

    FirebaseFirestore.instance
        .collection('registration')
        .where("userId", isEqualTo: user!.uid)
        .snapshots()
      ..listen((event) {
        event.docs.forEach((element) {
          itemlist.add(element.data().cast());
          // print("${element['name']}  jgjdgj ${element.data().cast()}" );
        });
      });
    setState(() {
      childlist = itemlist;
    });
  }

  void removeitems(String id, int index) async {
    try {
      await MyDatabase.instance.deletevaccine(index);
      await MyDatabase.instance.deletechild(index);
      await FirebaseFirestore.instance
          .collection('registration')
          .doc(id)
          .delete();
      setState(() {
        childlist.removeWhere((element) => element['userId'] == id);
      });
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Removed Successfully")));
    } on PlatformException catch (error) {
      var message = "An Error Ocurried";
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }

  late List<VaccineDB> vaccinedb;
  List<ChildDB> childdb = [];

  Map<String, List<VaccineDB>> childvaccinedata = {};
  getprocat() async {
    setState(() {
      loading = true;
    });
    childdb = await MyDatabase.instance.readAllchildDB();
    print('lll' + childdb.toString());
    if (childdb != []) {
      for (int i = 0; i < childdb.length; i++) {
        List<VaccineDB> pro =
            await MyDatabase.instance.readvaccine(childdb[i].ChildDBID!);
        childvaccinedata.putIfAbsent(i.toString(), () => pro);
      }
      print("llllll");
      setState(() {
        loading = false;
      });
      print("llllll");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    childdata();
    getprocat();
    super.initState();
  }

// String chilrdimage= getimage;
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
          title: Text("My Profile"),

          //   backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
        ),
        //   backgroundColor:Theme.of(context).colorScheme.background,
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder(
                future: getDataaa(),
                builder: (ctx, AsyncSnapshot futuresnapshot) {
                  if (!futuresnapshot.hasData || !futuresnapshot.data.exists) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final data = futuresnapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: size.height / 4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/b.jpg',
                                      ),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                              ),
                              Positioned(
                                left: size.width / 3,
                                top: size.height / 6,
                                child: Container(
                                  height: size.width / 3,
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          height: size.width / 3.3,
                                          width: size.width / 3.3,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 2,
                                              )),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            backgroundImage: NetworkImage(
                                              data['userimage'],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height / 9,
                        ),
                        Column(
                          children: [
                            Text(
                              data['username'],
                              style: textStyle,
                            ),
                            Text(
                              data['email'],
                              style: TextStyle(color: Colors.blueGrey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height / 60,
                        ),
                        Container(
                          padding: EdgeInsets.all(25),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "My Child",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          height: size.height / 1.2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 18),
                            itemCount: childlist.length,
                            itemBuilder: (context, index) {
                              var d = childvaccinedata['$index']!;
                              print("muji" + d[0].toString());
                              return Container(
                                  height: size.height / 1.5,
                                  width: size.width / 1.2,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width / 36),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Theme.of(context)
                                          .cardColor
                                          .withOpacity(0.25),
                                      border: Border.all(
                                          color: Colors.grey, width: 3)),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        left: -size.width / 18,
                                        top: childlist.length == 1
                                            ? -size.height / 40.2
                                            : -size.height / 160,
                                        child: Container(
                                            height: size.height / 5,
                                            width: size.width / 3,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      childlist[index]
                                                          ['childimage'],
                                                    ),
                                                    fit: BoxFit.cover))),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(top: 15, right: 15),
                                        alignment: Alignment.topRight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              childlist[index]['name'],
                                              style: textStyle,
                                            ),
                                            SizedBox(
                                              height: size.height / 60.4,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.date_range_rounded),
                                                Text(
                                                  childlist[index]['dob'],
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height: size.height / 120.8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.home),
                                                    Container(
                                                        width: size.width / 5,
                                                        child: FittedBox(
                                                            fit: BoxFit.none,
                                                            child: Text(
                                                              childlist[index][
                                                                      'address']
                                                                  .toString()
                                                                  .trim(),
                                                              style: TextStyle(
                                                                  fontSize: 17),
                                                            )))
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: size.width / 40,
                                                ),
                                                Row(
                                                  children: [
                                                    FaIcon(FontAwesomeIcons
                                                        .genderless),
                                                    if (childlist[index]
                                                        ['male'])
                                                      Text("Male"),
                                                    if (childlist[index]
                                                        ['female'])
                                                      Text("Female"),
                                                  ],
                                                )
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                              title: Text(
                                                                  "Confim Delete"),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Text(
                                                                      "Cancel"),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      removeitems(
                                                                          childlist[index]
                                                                              ['id'],
                                                                              
                                                                          index+1),
                                                                  child: Text(
                                                                      'Ok'),
                                                                )
                                                              ]));
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 30,
                                                )),
                                            Container(
                                              height: 300,
                                              child: ListView.builder(
                                                  itemCount: d.length,
                                                  itemBuilder: (context, inde) {
                                                    return ListTile(
                                                      title: Text(
                                                          d[inde].vaccinename),
                                                      leading: CircleAvatar(
                                                        backgroundColor: d[inde]
                                                                .isdone
                                                            ? Colors.green
                                                            : d[inde].istimegone
                                                                ? Colors.red
                                                                : Colors.yellow,
                                                        maxRadius: 15,
                                                      ),
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
