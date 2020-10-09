import 'package:demo_workerhub/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_workerhub/main.dart';
import 'package:demo_workerhub/utilities/constants.dart';
import 'package:toast/toast.dart';

class regScreen extends StatefulWidget {
  @override
  _regScreenState createState()=>_regScreenState();
}

class _regScreenState extends State<regScreen> {
  final databaseReference = FirebaseFirestore.instance;
  final myController_firstname = TextEditingController();
  final myController_lastname = TextEditingController();
  final myController_number= TextEditingController();
  final myController_age = TextEditingController();
  bool radioList_gender = true;
  final myController_pass = TextEditingController();

  Widget _buildFirstName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: myController_firstname,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Enter your First Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Last Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: myController_lastname,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Enter your Last Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile Number',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: myController_number,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              hintText: 'Enter your Mobile Number',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: myController_pass,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        Text('Gender',
        style: kLabelStyle,
        ),
        //SizedBox(height: 10),
        RadioListTile(value: true ,title: Text('Male', style: TextStyle(color: Colors.white, fontFamily: 'OpenSans')) ,groupValue: radioList_gender, onChanged: (val){
          setState(() {
            radioList_gender=val;
          });
        }),
        RadioListTile(value: false , title: Text('Female', style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),), groupValue: radioList_gender, onChanged: (val) {
          setState(() {
            radioList_gender=val;
          });
        })
      ],

    );
  }
  Widget _buildAge(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Age',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: myController_age,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.supervisor_account,
                color: Colors.white,
              ),
              hintText: 'Enter your Age in years',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );

  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('Register Button Pressed');
          int age_parsed = int.parse(myController_age.text);
          createRecord(myController_firstname.text, myController_lastname.text, myController_number.text, myController_pass.text, age_parsed, radioList_gender);
          //checkCred(myController_mail.text, myController_pass.text);
          Toast.show("Registration Successful", context, gravity: Toast.CENTER);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[

              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(

                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              /*Container(
                height: double.infinity,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('asset/background.png',
                            fit: BoxFit.cover,
                            scale: 0.7,),
                        ]
                    )
                ),
              ),



              Container(
                padding: EdgeInsets.only(bottom: 25.0),
                alignment:Alignment(0, -0.55),
                child: Image.asset('asset/logo.png',
                  fit: BoxFit.fill,
                  scale: 3,),




              ),*/

              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        'Worker Hub',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildFirstName(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildLastName(),
                      SizedBox(height: 30.0),
                      _buildMobileNumber(),
                      SizedBox(height: 30.0),
                      _buildPasswordTF(),
                      SizedBox(height: 30.0),
                      _buildGenderMenu(),

                      _buildAge(),
                      //_buildSignInWithText(),
                      //_buildSocialBtnRow(),
                      _buildRegisterBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createRecord(String first_name, String last_name, String number, String password, int age, bool gender) async {

    DocumentReference ref = await FirebaseFirestore.instance.collection("users")
        .add({
      "first_name":first_name,
      "last_name":last_name,
      "number":number,
      "password":password,
      "age":age,
      "gender":gender,
      "no_jobs_applied":0,
    });
    print(ref.id);
  }


}