import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = Provider.of<AuthProvider>(context, listen: false).userModel;
    print(userModel.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.lightBlue),
          title: Text(
            "My Profile",
            style: TextStyle(color: Colors.lightBlue),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: Colors.lightBlueAccent,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3 - 15,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 35),
                    width: 150,
                    height: 150,
                    child: CircularProfileAvatar(
                      "",
                      child: Image.asset(
                        "assets/images/doctor.jpg",
                        fit: BoxFit.cover,
                      ),
                      radius: 100,
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person_outline,color: Colors.lightBlueAccent,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${userModel.name}",style: TextStyle(fontSize: 17.0),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.email,color: Colors.lightBlueAccent,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${userModel.email}",style: TextStyle(fontSize: 17.0),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone_android,color: Colors.lightBlueAccent,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${userModel.phone}",style: TextStyle(fontSize: 17.0),),
                      ),
                    ],
                  ),
                ),
                InkWell(onTap: (){
                  
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.rainbow,color: Colors.lightBlueAccent,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${userModel.phone}",style: TextStyle(fontSize: 17.0),),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.textHeight,color: Colors.lightBlueAccent,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${userModel.phone}",style: TextStyle(fontSize: 17.0),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.weightHanging,color: Colors.lightBlueAccent,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${userModel.phone}",style: TextStyle(fontSize: 17.0),),
                      ),
                    ],
                  ),
                ),




              ],
            ),
          ],
        ));
  }
}
