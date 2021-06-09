import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_gateway/constants/strings.dart';
import 'package:payment_gateway/payment_gateway.dart';
import 'package:payment_gateway/utils/validator.dart';

import 'AppHeader.dart';
import 'PaymentMode.dart';
import 'constants/constants.dart';
import 'internet_connectivity.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  LoginScreen({Key? key, required this.controller}) : super(key: key);

  PageController? controller;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  late InternetConnectivity _internetConnectivity;
  bool _loading = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  void initState() {
    super.initState();
    _internetConnectivity = new InternetConnectivity();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: _buildWidget(),
        ),
      ),
    );
  }

  Widget _buildWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "CONTACT DETAILS",
            style: TextStyle(
                color: UIConstants.textColorSecondary,
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
          ),
          const SizedBox(
            height: 40,
          ),
          BorderTextField(
              context: context,
              key: Key('name'),
              labelText: StringConstants.label_name,
              prefixIcon: Icon(Icons.account_circle_sharp),
              autoValidateMode: autoValidate,
              inputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              controller: _fullNameController,
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return StringConstants.name_empty_msg;
                }
                return null;
              }),
          const SizedBox(
            height: 24,
          ),
          BorderTextField(
              context: context,
              key: Key('email_address'),
              labelText: StringConstants.label_email,
              prefixIcon: Icon(Icons.email_outlined),
              autoValidateMode: autoValidate,
              inputType: TextInputType.emailAddress,
              controller: _emailController,
              textInputAction: TextInputAction.next,
              validator: (String? value) {
                return Validator.validateEmailAddress(email: value);
              }),
          const SizedBox(
            height: 24,
          ),
          BorderTextField(
              context: context,
              key: Key('mobile_number'),
              labelText: StringConstants.label_mobile,
              prefixIcon: Icon(Icons.phone),
              autoValidateMode: autoValidate,
              inputType: TextInputType.numberWithOptions(),
              controller: _phoneController,
              textInputAction: TextInputAction.done,
              validator: (String? value) {
                return Validator.validateMobileNumber(number: value);
              }),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.controller!.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  } else {
                    setState(() {
                      autoValidate = true;
                    });
                  }
                },
                child: Text(
                  'PROCEED',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: UIConstants.primaryColor,
                    shape: RoundedRectangleBorder(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24))),
          ),
        ],
      ),
    );
  }

  void _showDialog(String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            title,
            style: const TextStyle(fontStyle: FontStyle.normal, fontSize: 18.0),
          ),
          content: new Text(
            body,
            style: const TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                OK,
                style: const TextStyle(
                    fontStyle: FontStyle.normal, fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showProgressDialog() {
    setState(() {
      _loading = true;
    });
  }

  void hideProgressDialog() {
    setState(() {
      _loading = false;
    });
  }
}
