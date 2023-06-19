import 'package:carta3/models/allCarsmodel.dart';
import 'package:carta3/models/allTransactions.dart';
import 'package:carta3/network/remote/dio_Helper.dart';
import 'package:carta3/pages/fine/payment.dart';
import 'package:carta3/shared/Components/components.dart';
import 'package:carta3/shared/constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Layout/layoutCubit.dart';
import '../reports/reportsScreen.dart';

class tDetail extends StatefulWidget {
  late Transactions tt;

  tDetail({
    Key? key,
    required this.tt,
  }) : super(key: key);

  @override
  State<tDetail> createState() => _tDetailState();
}

class _tDetailState extends State<tDetail> {
  Future<void> LaunchURL(String url) async {
    final Uri uri = Uri(host: url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw " can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    var cc = LayoutCubit.get(context).transactionsmodel.transactions;
    String session_url;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        foregroundColor: Color.fromARGB(255, 7, 7, 7),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              SizedBox(
                height: 30,
              ),
              itemProfile('Transaction ID', widget.tt.transactionId.toString(),
                  CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              itemProfile(
                  'License', widget.tt.vehicle, CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              itemProfile('Price', widget.tt.fine.toString(),
                  CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              itemProfile('Status', widget.tt.paymentStatus,
                  CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              itemProfile('Transaction Location', widget.tt.place,
                  CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              itemProfile('Date', widget.tt.adjustmentDate,
                  CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              itemProfile('Time', widget.tt.adjustmentTime,
                  CupertinoIcons.car_detailed),
              SizedBox(
                height: 30,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       // Reportedv car = Reportedv();
              //       // car.vnumber = tt.vehicle;

              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //         builder: (context) => ReportsScreen(
              //       //               vehicle: tt.vehicle,
              //       //               date: tt.adjustmentDate,
              //       //               time: tt.adjustmentTime,

              //       //               // tt: cc[index],
              //       //             )));
              //     },
              //     child: Text(
              //       "Report",
              //     )),
              ElevatedButton(
                  onPressed: () {
                    DioHelper.getData(
                      url:
                          'http://192.168.1.9:4242/transactions/$ssn/checkout-session/${widget.tt.transactionId}',
                    ).then((value) {
                      session_url = value.data['url'];
                      navigateTo(context, PaymentWebWiew(session_url));
                      print('your seeion url $session_url');
                    }).catchError((error) {
                      print(error.toString());
                    });
                    // LaunchURL('$session_surl');

                    // navigateTo(context, PaymentWebWiew(session_url));
                  },
                  child: Text(
                    "Pay",
                  )),
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.blue.withOpacity(.2),
              spreadRadius: 3,
              blurRadius: 10,
            ),
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
