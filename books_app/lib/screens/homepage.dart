import 'package:books_app/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
/*
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOMEPAGE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hi, Sedat',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Discover Latest Book',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  )),
              Container(
                height: 39,
                margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search book..',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                    Positioned(
                        top: 8,
                        right: 9,
                        child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ))),
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 25),
                child: DefaultTabController(
                  length: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TabBar(
                          labelPadding: EdgeInsets.only(left: 25, right: 25),
                          indicatorPadding: EdgeInsets.all(0),
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          indicatorColor: Colors.deepOrange,
                          indicatorSize: TabBarIndicatorSize.label,

                          //indicator: RoundedRectangleTabIndicator(
                          //  weight: 2, width: 10, color: Colors.white),
                          tabs: [
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 17, left: 17),
                                child: Text('New'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 17, left: 17),
                                child: Text('Trending'),
                              ),
                            ),
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 17, left: 17),
                                child: Text('Best Seller'),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 210,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 25, right: 6),
                    itemCount: 10,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 1),
                        height: 210,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/book.jpg'),
                            )),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        /*    print('ListView Tapped');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedBookScreen(
                                popularBookModel: populars[index]),
                          ),
                        );*/
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 19),
                        height: 81,
                        width: MediaQuery.of(context).size.width - 50,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 81,
                              width: 62,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/book.jpg'),
                                  ),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 21,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Kürk Mantolu Madonna ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Sabahattin Ali",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$' + "20",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 90),
                                child: Icon(
                                  Icons.arrow_right_outlined,
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_sharp),
            label: 'Shopping',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
