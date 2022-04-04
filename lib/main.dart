import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late TextEditingController _controller, _controller2, _m1, _m2, _m3;
  int total = 0;
  double percentage = 0.0;
  String result = "Result";

  @override
  void initState() {
    _controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _controller2 = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _m1 = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _m2 = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _m3 = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _m1.dispose();
    _m2.dispose();
    _m3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MSCIT"),
          backgroundColor: Colors.grey[700],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(_controller.text + ":" + _controller2.text)),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          labelText: 'Name', hintText: 'Enter Your Name'),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _controller2,
                      decoration: const InputDecoration(
                          labelText: 'Last Name', hintText: 'Enter Last Name'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _m1,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 2,
                      decoration: const InputDecoration(
                          labelText: 'Android', hintText: 'Enter Android'),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _m2,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                          labelText: 'Hadoop', hintText: 'Enter Hadoop'),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: _m3,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                          labelText: 'CC', hintText: 'Enter Cloud Computing'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (_m1.text == '' ||
                              _m1.text == '' ||
                              _m1.text == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("One of the field is empty..")));
                          }
                          int m1 = int.parse(_m1.text),
                              m2 = int.parse(_m2.text),
                              m3 = int.parse(_m3.text);
                          if (m1 < 28 || m2 < 28 || m3 < 28) {
                            total = m1 + m2 + m3;
                            result = "Fail";
                            percentage = 0.0;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Your are failed'),
                              action: SnackBarAction(
                                label: 'Undo Now',
                                onPressed: () {
                                  _m1.clear();
                                  _m2.clear();
                                  _m3.clear();
                                  total = 0;
                                  result = "Result";
                                  percentage = 0.0;
                                },
                              ),
                            ));
                          } else {
                            total = m1 + m2 + m3;
                            percentage = (total / 300) * 100;
                            if (percentage >= 80) {
                              result = "Above Distinction";
                            } else if (percentage >= 70) {
                              result = "Distinction";
                            } else if (percentage >= 60) {
                              result = "First Class";
                            } else if (percentage >= 50) {
                              result = "Second Class";
                            } else if (percentage >= 40) {
                              result = "Passed";
                            }
                          }
                        });
                      },
                      icon: const Icon(Icons.calculate),
                      label: const Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(total.toString()),
                      color: Colors.amberAccent,
                      padding: const EdgeInsets.all(10),
                    ),
                    Container(
                      child: Text(percentage.toStringAsFixed(2)),
                      color: Colors.amberAccent,
                      padding: const EdgeInsets.all(10),
                    ),
                    Container(
                      child: Text(result),
                      color: Colors.amberAccent,
                      padding: const EdgeInsets.all(10),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
