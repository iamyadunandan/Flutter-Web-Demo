import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MockRate extends StatefulWidget {
  double rating = 0;
  MockRate({Key key}) : super(key: key);

  @override
  _MockRateState createState() => _MockRateState();
}

class _MockRateState extends State<MockRate> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 1,
        ), () {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey[200],
          content: Text(
            'Try to rate the pizza..',
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          elevation: 0,
        ),
        extendBodyBehindAppBar: false,
        body: Container(
          color: Colors.cyan,
          height: double.maxFinite,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightForFinite(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[50],
              ),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Your special pizza: ',
                      style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Image.asset('assets/pizza.png'),
                      alignment: Alignment.center,
                    ),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Rating: ',
                            style: TextStyle(
                              fontFamily: 'ZillaSlab',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          SmoothStarRating(
                            size: 32,
                            allowHalfRating: false,
                            defaultIconData: Icons.star_border,
                            filledIconData: Icons.star,
                            starCount: 5,
                            rating: widget.rating,
                            color: Colors.deepOrange[900],
                            onRatingChanged: (r) {
                              setState(() {
                                widget.rating = r;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Text(
                      'This mock pizza was introduced in the year 1476 by the legendary mock-er-II, Filled with mouth watering mock cheese and mock toppings..',
                      style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                      maxLines: 5,
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text(
                          'Order now',
                          style: TextStyle(
                            color: Colors.grey[50],
                            fontFamily: 'ZillaSlab',
                          ),
                        ),
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
