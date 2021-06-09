import 'package:flutter/material.dart';

import 'AppHeader.dart';

class PaymentMode extends StatefulWidget {
  static const String routeName = "/PaymentMode";
  PaymentMode({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<PaymentMode> {
  List<PaymentMethodModel> _paymentMethodList = <PaymentMethodModel>[];
  @override
  void initState() {
    super.initState();
    _generateStaticPaymentMethodList();
  }

  void _generateStaticPaymentMethodList() {
    final PaymentMethodModel model1 =
        PaymentMethodModel("images/sample.jpeg", "CREDIT/DEBIT/ATM CARD");
    final PaymentMethodModel model2 =
        PaymentMethodModel("images/sample.jpeg", "NET BANKING");
    final PaymentMethodModel model3 =
        PaymentMethodModel("images/sample.jpeg", "WALLETS");
    final PaymentMethodModel model4 =
        PaymentMethodModel("images/sample.jpeg", "UPI");

    _paymentMethodList.add(model1);
    _paymentMethodList.add(model2);
    _paymentMethodList.add(model3);
    _paymentMethodList.add(model4);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildWidget(),
    );
  }

  Widget _buildWidget() {
    return new Column(children: [
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Text(
          "SAVED CARDS",
          style: const TextStyle(
              color: Colors.grey, fontStyle: FontStyle.normal, fontSize: 14.0),
        ),
      ),
      Container(
          height: 40,
          color: Colors.grey[100],
          margin: EdgeInsets.only(left: 20, right: 20)),
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Text(
          "PAYMENT METHODS",
          style: const TextStyle(
              color: Colors.grey, fontStyle: FontStyle.normal, fontSize: 14.0),
        ),
      ),
      Container(
        height: 300,
        //color: Colors.amber,
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
          itemCount: _paymentMethodList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Row(
                children: [
                  Container(
                    child: Expanded(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Image.asset('images/sample.jpeg'),
                            onPressed: () => () {},
                          ),
                          Text(
                            _paymentMethodList[index].paymentMethod.toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[300],
                    size: 18.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      InkWell(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.7,
          color: Color(0xFFd9e7f7),
          margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
          child: Text(
            "PAY NOW",
            style: const TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
      ),
    ]);
  }
}

class PaymentMethodModel {
  String icon;
  String paymentMethod;
  PaymentMethodModel(this.icon, this.paymentMethod);
}
