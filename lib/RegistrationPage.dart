import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Registration"),
      ),
    body:  SingleChildScrollView(

      child: Center(

        child: Card(
          margin: const EdgeInsets.all(25.0),
          elevation: 0,

          child: Column(
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.all(10.0)
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'User Name',
                  hintText: 'Enter User Name',
                  prefixIcon: Icon(Icons.person, color: Colors.red,),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.all(10.0)
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: 'Enter Mobile Number',
                  prefixIcon: Icon(Icons.phone, color: Colors.red,),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.all(10.0)
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  prefixIcon: Icon(Icons.password, color: Colors.red,),
                ),
              ),

              const Padding(
                  padding: EdgeInsets.all(15.0)
              ),
              ElevatedButton(
                child: Text('SUBMIT'),

                onPressed: (){
                  print("SUBMIT");
                },
              )

            ],
          ),

        ),
      ),

    )
    );

  }
}
