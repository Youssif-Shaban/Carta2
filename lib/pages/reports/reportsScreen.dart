import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/allTransactions.dart';

// ignore: non_constant_identifier_names
class Reportedv {
  String vnumber = '';
}

Reportedv car = Reportedv();

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Your Reports"),
            Text(car.vnumber),
          ],
        ),
      ),
    );
  }
}
