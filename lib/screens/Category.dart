import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:how_is_your_health/Providers/AuthProvider.dart';
import 'package:how_is_your_health/models/UserModel.dart';
import 'package:how_is_your_health/models/categoryModel.dart';
import 'package:how_is_your_health/screens/QuestionScreen.dart';
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
