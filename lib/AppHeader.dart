import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  late String amount;

  @override
  _AppHeader createState() => _AppHeader();
}

class _AppHeader extends State<AppHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.loose,
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 60,
                child: Container(
                  color: Color(0xFFe0eefe),
                ),
              ),
              Expanded(
                flex: 40,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(8, 48, 8, 8),
          child: Row(
            children: [
              /*Expanded(
                  flex: 4,
                  child: ),*/
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                color: Colors.white,
                elevation: 3.0,
                child: Container(
                  width: 140,
                  height: 140,
                  /*child: Image.asset(
                    'images/sample.jpeg',
                    fit: BoxFit.contain,
                    // height: 20,
                    // width: 20,
                  ),*/
                  // color: Colors.white,
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // const SizedBox(width: 12,),
                            Image.asset(
                              'packages/payment_gateway/img/safexpay_icon.png',
                              fit: BoxFit.contain,
                              height: 45,
                              // width: 20,
                            ),
                            const SizedBox(width: 4,),
                            Container(
                              margin: EdgeInsets.only(bottom: 50),
                              height: 40,
                              width: 40,
                              alignment: Alignment.topRight,
                              child: Icon(Icons.close, size: 30, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Card(
                          color: Colors.white,
                          elevation: 3.0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            // width: MediaQuery.of(context).size.height,
                            // color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Total Amount",
                                    style: const TextStyle(
                                        color: Color(0xFF687982),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.0),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "10 INR",
                                      textDirection: TextDirection.ltr,
                                      style: const TextStyle(
                                        letterSpacing: 2,
                                          color: Color(0xFF687982),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0),
                                    ),
                                    // const SizedBox(width: 8,),
                                    Text(
                                      "Order No. 123",
                                      textDirection: TextDirection.ltr,
                                      style: const TextStyle(
                                          color: Color(0xFF687982),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
