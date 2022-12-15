import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
    body: Card(
      margin: EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0)
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'User Name',
                hintText: 'Enter User Name',
                prefixIcon: Icon(Icons.person),
              ),
            ),

            Padding(
                padding: EdgeInsets.all(10.0)
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: 'Enter Mobile Number',
                  prefixIcon: Icon(Icons.phone),
              ),
            ),

            Padding(
                padding: EdgeInsets.all(10.0)
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  prefixIcon: Icon(Icons.password),
              ),
            ),

            ElevatedButton(
                child: Text('SUBMIT'),
                onPressed: (){},
                )
          ],

        ),


      ),
    ),
    );
  }
}
