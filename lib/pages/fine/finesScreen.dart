import 'package:carta3/Layout/layoutCubit.dart';
import 'package:carta3/Layout/layoutStates.dart';
import 'package:carta3/models/allCarsmodel.dart';
import 'package:carta3/models/allTransactions.dart';
import 'package:carta3/pages/carsScreen/vDetail.dart';
import 'package:carta3/shared/Components/components.dart';
import 'package:carta3/shared/constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fineDetails.dart';

class FineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionsModel ttmodel;
    var cc = LayoutCubit.get(context).transactionsmodel.transactions;
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: LayoutCubit.get(context).transactionsmodel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => tDetail(
                              tt: cc[index],
                            )));
              },
              child: buildTransactionItem(cc[index]),
            ),
            separatorBuilder: (context, index) => myDivider(),
            itemCount:
                LayoutCubit.get(context).transactionsmodel.transactions.length,
          ),
          fallback: (context) => CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildTransactionItem(Transactions ttmodel) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.only(right: 10),
          height: 140,
          width: 350,
          decoration: BoxDecoration(
            color: Color(0xffF5D7DB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Container(
              height: 100,
              width: 90,
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffd4ecf7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/car.png",
                height: 150,
                width: double.infinity,
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 20, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Location: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ttmodel.place,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Date: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ttmodel.adjustmentDate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Time: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ttmodel.adjustmentTime,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      ttmodel.fine.toString(),
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$",
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // GestureDetector(
                //   child: Container(
                //     margin: EdgeInsets.only(left: 6),
                //     height: 50,
                //     width: 50,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Color(0xffe8bcb9),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Pay",
                //         style: TextStyle(
                //           fontSize: 15,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ]),
        ),
      );
}
