import 'package:flutter/material.dart';
import 'package:untitled111/city_pirogovskiy_details/dimensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled111/firebase_options.dart';



  class getOrder extends StatefulWidget {
  const getOrder({super.key});
  @override
  State<getOrder> createState() => _getOrder();
  }

  class _getOrder extends State<getOrder> {

  void initFireBase() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  }


// микс, отображение заказов из базы данных, основа c интернета, все новое, но дизайн старый
    @override
  Widget newlist() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('zakaznew').snapshots(),
        builder: (context, snapshot) {
          var clientWidgets = [];
          var idList = [];
          var countindex = [];
          // List clientWidgets = [];
          if (snapshot.hasData) {
            final clients = snapshot.data!.docs.reversed.toList();
            for (var client in clients) {
              var _userToDo1 = client['number'];
              var _userLogo1 = client['logo'];
              var _userType1 = client['type'];
              var _userNetto1 = client['netto'];
              var _userId = client['id'];
              var docId = client.id;
              clientWidgets.add(
                  '- $_userToDo1, $_userLogo1, $_userType1,  $_userNetto1'); // список для отображения данных
              idList.add(
                  docId); // список для id, потом по этому id происходит удаление.
            }
            for (var count in countindex) {
              var _count = count;
            }
          }

          return ListView.separated(
            itemCount: clientWidgets.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: height2);
            },
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(clientWidgets[index]),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                  //padding: const EdgeInsets.only(top: 0, left: 5, right: 5),

                  //height: 45,

                  child: Card(
                    margin: const EdgeInsets.only(
                        left: 1.0, right: 1.0, top: 1.0, bottom: 1.0),
                    //padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
                    color: Colors.grey[300],
                    child: ListTile(
                      title: Text(clientWidgets[index]),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  //clientWidgets.removeAt(index);
                  FirebaseFirestore.instance
                      .collection("zakaznew")
                      .doc(idList[index])
                      .delete();
                },
              );
            },
          );
        });
  }




}