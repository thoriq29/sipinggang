import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sipinggang/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sipinggang/presentation/hasil_diagnosa_screen/hasil_diagnosa_screen.dart';
import 'package:sipinggang/provider/auth_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';
  static CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('diagnosticResults');

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Sipinggang"),
          actions: [
            IconButton(
                onPressed: () {
                  AuthProvider().logOut(context);
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Consumer<AuthProvider>(builder: (context, authProvider, _) {
          return StreamBuilder<QuerySnapshot>(
              stream: _collectionReference
                  .where("userDocUid",
                      isEqualTo: authProvider.auth.currentUser?.uid)
                  .snapshots(),
              builder: (
                context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot result = snapshot.data!.docs[index];
                    Timestamp timestamp = result['diagnosisDate'];
                    DateTime dateTime = timestamp.toDate();
                    String formattedDate =
                        DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HasilDiagnosaScreen(diagnosaData: {
                              "userDocUid": result["userDocUid"],
                              "diagnosis": result["diagnosis"],
                              "diagnosisDate": result["diagnosisDate"],
                              "type": result["type"],
                              "solutions": result["solutions"],
                              "code": result["code"]
                            }),
                          ),
                        );
                      },
                      title: Text(result['diagnosis']),
                      subtitle: Text(formattedDate),
                    );
                  },
                );
              });
        }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          focusColor: Colors.green,
          onPressed: () {
            AppNavigation().onTapJenisPenyakit(context);
          },
        ),
      ),
    );
  }
}
