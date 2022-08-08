import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? img;
  final String? title;
  final String? price;
  final BuildContext? ctx;

  DetailsPage({this.img, this.title, this.price, this.ctx});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/candel$img.jpg',
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        IconButton(
          padding: EdgeInsets.only(top: 65, left: 20),
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title!,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '\$ $price',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('SIZE'),
                            Text('10'),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('QTY'),
                            Text('1'),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 1.5),
                    ListTile(
                      leading: Text('Details', style: TextStyle(fontSize: 18)),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                    Divider(thickness: 1.5),
                    ListTile(
                      leading: Text('Shipping Details',
                          style: TextStyle(fontSize: 18)),
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                    Divider(thickness: 1.5)
                  ],
                ),
              )),
              Container(
                // color: Colors.amber,
                height: 80,
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border))),
                      makeAddToCartButton('Add To Cart', context)
                    ]),
              )
            ]),
          ),
        )
      ],
    ));
  }

  ElevatedButton makeAddToCartButton(String text, BuildContext ctx) {
    return ElevatedButton.icon(
      icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.pink[200],
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(ctx).size.width / 6, vertical: 10),
          textStyle:
              TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 1)),
      onPressed: () {},
      label: Text(text),
    );
  }
}
