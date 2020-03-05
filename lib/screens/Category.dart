import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:how_is_your_health/models/categoryModel.dart';
import 'package:how_is_your_health/screens/QuestionScreen.dart';
import 'package:how_is_your_health/screens/UserProfile.dart';
import 'package:provider/provider.dart';
import 'package:statusbar_util/statusbar_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  SwiperController controller = SwiperController();
  List<categoryModel> _listCategory = categoryModel.categoryList;
  UserModel userModel;
  List<String> swiperImage = [
    "assets/images/d.jpg",
    "assets/images/TheFemaleDoctor.jpg",
    "assets/images/doctora.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = Provider.of<AuthProvider>(context, listen: false).userModel;
    print(userModel.name);
  }

  @override
  Widget build(BuildContext context) {
    StatusbarUtil.setTranslucent();
    StatusbarUtil.setStatusBarFont(FontStyle.black);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.lightBlue),
        centerTitle: true,
        title: Text(
          "How is your health ? ",
          style: TextStyle(color: Colors.lightBlue),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Image.asset("assets/images/doctor.jpg",width: 60,height: 60,)),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.lightBlue,
                Colors.lightBlueAccent
              ])),
            ),
            ListTile(
              title: InkWell(
                splashColor: Colors.lightBlueAccent,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => UserProfile()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Profile",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ]),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: InkWell(
                splashColor: Colors.lightBlueAccent,
                onTap: () {},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.question_answer),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "My Questions",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ]),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: InkWell(
                splashColor: Colors.lightBlueAccent,
                onTap: () {},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.more),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "About US",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ]),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: InkWell(
                splashColor: Colors.lightBlueAccent,
                onTap: () {},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.exit_to_app),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Log Out",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right)
                    ]),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Swiper(
                autoplay: true,
                itemWidth: 20,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return Image.asset(
                    swiperImage[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3.0,
                    crossAxisSpacing: 3.0),
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoryModel.categoryList.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen()),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "${_listCategory[index].image}",
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                          Text("${_listCategory[index].categoryName}")
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
