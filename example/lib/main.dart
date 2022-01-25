import 'package:flutter/material.dart';
import 'package:text_style_editor/text_style_editor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextStyleEditor Demo',
      theme: ThemeData.light(),
      // theme: ThemeData.dark(),
      home: MyHomePage(title: 'TextStyleEditor Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fonts = [
    'Billabong',
    'AlexBrush',
    'Allura',
    'Arizonia',
    'ChunkFive',
    'GrandHotel',
    'GreatVibes',
    'Lobster',
    'OpenSans',
    'OstrichSans',
    'Oswald',
    'Pacifico',
    'Quicksand',
    'Roboto',
    'SEASRN',
    'Windsong',
  ];

  TextStyle? textStyle;
  TextAlign? textAlign;

  @override
  void initState() {
    textStyle = TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontFamily: 'OpenSans',
      decoration: TextDecoration.none,
    );

    textAlign = TextAlign.center;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  showCursor: false,
                  decoration: new InputDecoration(
                      border: InputBorder.none, hintText: 'Text'),
                  style: textStyle,
                  textAlign: textAlign!,
                  // maxLines: 10,
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Container(
                height: 300,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: TextStyleEditor(
                    fonts: fonts,
                    textStyle: textStyle!,
                    textAlign: textAlign!,
                    initialTool: EditorToolbarAction.fontFamilyTool,
                    onTextAlignEdited: (align) {
                      setState(() {
                        textAlign = align;
                      });
                    },
                    onTextStyleEdited: (style) {
                      setState(() {
                        textStyle = textStyle!.merge(style);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
