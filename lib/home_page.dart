import 'package:flutter/material.dart';
import 'package:maths/const.dart';
import 'package:maths/util/number_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// number pad list
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.deepPurple,
          ),

          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  '1 + 1 = ?',
                  style: whiteTextStyle,
                ),
              ),
            ),
          ),

          // number pad
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(child: numberPad[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
