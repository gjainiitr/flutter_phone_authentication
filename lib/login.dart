import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Phone Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
                child:IntlPhoneField(
                  decoration: InputDecoration( //decoration for Input Field
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'NP', //default contry code, NP for Nepal
                  onChanged: (phone) {
                    //when phone number country code is changed
                    // print(phone.completeNumber); //get complete number
                    // print(phone.countryCode); // get country code only
                    // print(phone.number); // only phone number
                    phoneNumber = phone.countryCode + '-' + phone.number;
                  },
                )
            ),
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPScreen(phoneNumber)));
              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}