import 'package:flutter/material.dart';
import 'package:shop_app/details_page.dart';
import 'components/linebar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 10)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BottomBarIcon(Icons.shopping_bag),
            BottomBarIcon(Icons.favorite),
            BottomBarIcon(Icons.home, selected: true),
            BottomBarIcon(Icons.person),
            BottomBarIcon(Icons.settings),
          ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        toolbarHeight: 70,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        leading: Image.asset('assets/images/hamburger.png'),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/SEARCH.png'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Welcome To My Shop',
              style: TextStyle(
                  fontSize: 26, letterSpacing: 1, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MakeElevatedButtons('Home&Decor', selected: true),
              MakeElevatedButtons('Bath&Body'),
              MakeElevatedButtons('Beauty'),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 20,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildColumnTop('Candels', selected: true),
                        buildColumnTop('Vases', selected: false),
                        buildColumnTop('Bins', selected: false),
                        buildColumnTop('Floral', selected: false),
                        buildColumnTop('Decor', selected: false),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          ImageGrid('1', 'Elemental Tin Candel', '20', context),
                          ImageGrid('2', 'Summer Candel', '30', context),
                          ImageGrid('3', 'Winter Candel', '40', context),
                          ImageGrid('4', 'Elemental Tin Candel', '60', context),
                        ],
                      ),
                    ),
                    LineBar(),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Text(
                            'Holiday Special',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            'Viee All',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ImagegridBottom(
                              '1', 'Elemental Tin Candel', '10 pcs', '20'),
                          ImagegridBottom(
                              '2', 'Elemental Tin Candel', '20 pcs', '30'),
                          ImagegridBottom(
                              '3', 'Elemental Tin Candel', '10 pcs', '40'),
                          ImagegridBottom(
                              '4', 'Elemental Tin Candel', '10 pcs', '50'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container BottomBarIcon(IconData icon, {bool selected = false}) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? Colors.pink[200] : Colors.white,
          boxShadow: selected
              ? [BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)]
              : []),
      child: Icon(
        icon,
        color: selected ? Colors.white : Colors.black,
      ),
    );
  }

  Container ImagegridBottom(
      String img, String title, String subtitle, String price) {
    return Container(
      height: 130,
      width: 220,
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 120,
              width: 100,
              child: Image.asset(
                'assets/images/candel$img.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    title,
                    maxLines: 2,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Spacer(),
                Text(
                  '\$ $price',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector ImageGrid(
      String img, String title, String price, BuildContext ctx) {
    return GestureDetector(
      onTap: () {
        Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
          return DetailsPage(img: img, title: title, price: price, ctx: ctx);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 220,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/candel$img.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(title),
            SizedBox(height: 5),
            Text(
              '\$ $price',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton MakeElevatedButtons(String text, {bool selected = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: selected ? Colors.pink[200] : Colors.grey[500],
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          textStyle: TextStyle(
              fontSize: 13, color: selected ? Colors.white : Colors.black)),
      onPressed: () {},
      child: Text(text),
    );
  }

  Column buildColumnTop(String text, {bool selected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 13, color: selected ? Colors.black : Colors.grey),
        ),
        SizedBox(height: 5),
        if (selected)
          Container(
            width: 5,
            height: 5,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          )
      ],
    );
  }
}
