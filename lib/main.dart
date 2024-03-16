import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class OurWork {
  String? image;
  String? work;
  OurWork({this.image, this.work});
}

final List<OurWork> imageUrls = [
  OurWork(
      image: 'assets/png/our-work_1.jpg', work: 'Help children go to school'),
  OurWork(image: 'assets/png/our-work_2.jpg', work: 'Bring smile to them'),
  OurWork(image: 'assets/png/our-work_3.jpg', work: 'Enjoy their childhood')
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              SectionWidget(
                hasBackground: true,
                id: 'home',
                title: 'Helping Children Worldwide',
                content:
                    "It's been 13 years of fear, loss, danger and displacement for children in Syria. \n Half of them have grown up knowing nothing but conflict. \nAnd now they're dealing with yet more violence a year after the devastating aftermath of the earthquakes.\n 16.7 million people, of which 45% are children need humanitarian assistance. Donate now.",
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              SectionWidget(
                id: 'about',
                title: 'SAVE THE CHILDREN',
                content:
                    'Children’s lives, safety, well-being, \n and futures are under attack in an increasingly dangerous and unequal world. \n \n Nearly 300 million people – or 1 in 27 people – are expected to need humanitarian assistance this year.\n We will aim to assist 15.9 million children across 46 countries in response to the most significant threat to children’s rights in recent memory. \n \n Together, we will ensure no child is left behind. Join us!',
                crossAxisAlignment: CrossAxisAlignment.center,
                height: 300,
                contentStyle: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
              FilledButton(
                  onPressed: () {},
                  child: Text(
                    'Donate now',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SectionWidget(
                id: 'projects',
                title: 'Our Work',
                content: '',
                crossAxisAlignment: CrossAxisAlignment.center,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: imageUrls
                      .map((url) => Column(
                            children: [
                              Image.asset(
                                url.image ?? 'assets/png/our-work_1.jpg',
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                url.work ?? '',
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ))
                      .toList(),
                ),
              ),
              SectionWidget(
                id: 'get-involved',
                title: 'Get Involved',
                content:
                    'Learn how you can contribute, donate, or volunteer...',
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              SectionWidget(
                id: 'contact',
                title: 'Contact Us',
                content:
                    'Have questions or want to get in touch? Contact us...',
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/png/ic_stc.png',
                height: 32,
              ),
              const SizedBox(width: 16),
              Text(
                'Save the Children',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              NavItemWidget(text: 'Home', id: 'home'),
              NavItemWidget(text: 'About Us', id: 'about'),
              NavItemWidget(text: 'Projects', id: 'projects'),
              NavItemWidget(text: 'Get Involved', id: 'get-involved'),
              NavItemWidget(text: 'Contact', id: 'contact'),
            ],
          ),
        ],
      ),
    );
  }
}

class NavItemWidget extends StatelessWidget {
  final String text;
  final String id;

  NavItemWidget({required this.text, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextButton(
        onPressed: () {
          // Handle navigation to section with id
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String id;
  final String title;
  final String content;
  final bool hasBackground;
  final double height;
  final TextStyle contentStyle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign textAlign;

  SectionWidget(
      {required this.id,
      required this.title,
      required this.content,
      required this.crossAxisAlignment,
      this.hasBackground = false,
      this.height = 300,
      this.contentStyle = const TextStyle(
        fontSize: 16.0,
        color: Color.fromARGB(255, 250, 250, 250),
      ),
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.all(20.0),
      decoration: hasBackground
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/png/background.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            )
          : BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: hasBackground
                  ? Color.fromARGB(255, 250, 250, 250)
                  : Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            content,
            style: contentStyle,
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Text(
        '\u00A9 2024 Save the Children. All rights reserved.',
        style: TextStyle(
          fontSize: 12.0,
          fontStyle: FontStyle.italic,
          color: Colors.grey,
        ),
      ),
    );
  }
}
