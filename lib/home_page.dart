import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maths/const.dart';
import 'package:maths/util/number_key.dart';
import 'package:maths/util/result_message.dart';

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

  // number A, number B
  int numberA = 1;
  int numberB = 1;

// user answer
  String userAnswer = '';

  // user tapped a button
  void buttonTapped(String button) {
    setState(() {
      // userAnswer += button;
      //can put maximum of 3 numbers

      // if (userAnswer.length < 3) {
      //   userAnswer += button;
      // }

      if (button == '=') {
        //calculate if user is correct or incorrect
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        //delete the last number
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        // maximum of 3 numbers can be inputed
        userAnswer += button;
      }
    });
  }

  //check if user is correct or not
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Correct',
              onTap: goToNextQuestion,
              icon: Icons.arrow_forward,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
              message: 'Sorry try again',
              onTap: goBackToQuestion,
              icon: Icons.rotate_left,
            );
          });
    }
  }

  // create random numbers

  var randomNumber = Random();

// go to next question
  void goToNextQuestion() {
    // dismiss alert dialog
    Navigator.of(context).pop();

    // reset vlues
    setState(() {
      userAnswer = '';
    });

    // create a new quesion
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  // Go back to question
  void goBackToQuestion() {
    // dismiss alert dialogue
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
            height: 160,
            color: Colors.deepPurple,
          ),

          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //question
                    Text(
                      '$numberA + $numberB = ',
                      // '1 + 1 = ',
                      style: whiteTextStyle,
                    ),

                    // answer box

                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    ),
                  ],
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
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
