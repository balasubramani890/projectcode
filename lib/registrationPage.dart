import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projectcode/loginPage.dart';

Future _saveDetails(String name, String mobileNo, String password) async
{
  var url = "http://192.168.63.202/API/saveData.php";
  final response = await http.post(Uri.parse(url), body: {"name" : name, "mobileno" : mobileNo, "password" : password });
  var result = response.body;
  if(result == "true")
    {
      print("Success");
      return true;
    }
  else
    {
      print("Error Result : " +result);
      return false;
    }
}

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  // RegistrationPage()
  final tName = TextEditingController();
  final tMobileNo = TextEditingController();
  final tPassword = TextEditingController();

  bool _valName = false;
  bool _valMobileNo = false;
  bool _valPassword = false;

  void dispose()
  {
    tName.dispose();
    tMobileNo.dispose();
    tPassword.dispose();
  }

  void clearData()
  {
    tName.clear();
    tMobileNo.clear();
    tPassword.clear();
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Registration"),
      ),
    body:  Form(
      key : _formKey,
      child: SingleChildScrollView(

        child: Center(

          child: Card(
            margin: const EdgeInsets.all(25.0),
            elevation: 0,

            child: Column(
              children: <Widget>[
                const Padding(
                    padding: EdgeInsets.all(10.0)
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Enter User Name',
                    prefixIcon: const Icon(Icons.person, color: Colors.red,),
                    errorText: _valName ? 'Please Enter Name' : null,
                  ),
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z]+$')),
                  // ],
                  controller: tName,
                  validator: (value){
                    if(value=="")
                      {
                        return 'Please Enter Name';
                      }
                    return null;
                  },

                ),

                const Padding(
                    padding: EdgeInsets.all(10.0)
                ),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    hintText: 'Enter Mobile Number',
                    prefixIcon: const Icon(Icons.phone, color: Colors.red,),
                    errorText: _valMobileNo ? 'Please Enter Mobile Number' : null,
                  ),
                  keyboardType: TextInputType.phone,
                  controller: tMobileNo,
                  onChanged: (value){
                    _formKey.currentState?.validate();
                  },
                  validator: (value){
                    if(value!.isEmpty) {
                      return 'Please Enter Mobile Number';
                    }else if(!RegExp(r'^[0-9]{10}$').hasMatch(value) && value.length < 10 || value.length > 10)
                      {
                        return 'Please Enter Valid Mobile Number';
                      }
                  },
                ),

                const Padding(
                    padding: EdgeInsets.all(10.0)
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    prefixIcon: const Icon(Icons.password, color: Colors.red,),
                    errorText: _valPassword ? 'Please Enter Password' : null,
                  ),
                  controller: tPassword,
                  validator: (value){
                    if(value==null || value.isEmpty)
                    {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),

                const Padding(
                    padding: EdgeInsets.all(15.0)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    ElevatedButton(
                      child: Text('SUBMIT'),

                      onPressed: ()  {
                        setState(() async {
                          tName.text.isEmpty ? _valName = true : _valName = false;
                          tMobileNo.text.isEmpty ? _valMobileNo = true : _valMobileNo = false;
                          tPassword.text.isEmpty ? _valPassword = true : _valPassword = false;

                          if(_valName == false && _valMobileNo == false && _valPassword == false)
                          {
                            bool resultStatus = await _saveDetails(tName.text, tMobileNo.text, tPassword.text);
                            if(resultStatus == true)
                            {
                              if(!mounted) return;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()),);
                              clearData();
                            }
                          }

                        });
                      },
                    ),

                    ElevatedButton(
                        child:  const Text('CLEAR'),
                        onPressed: (){
                          clearData();
                        }
                    ),

                    ElevatedButton(
                      child: const Text('LOGIN'),

                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),

                  ],
                )

              ],
            ),

          ),
        ),

      ),
    )
    );
  }
}
