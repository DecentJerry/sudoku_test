import 'package:flutter/material.dart';
import 'package:flutter_application_test/enum.dart';

class Account extends StatelessWidget {
  Account({super.key});

  context() => null;
  bool light = true;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.pause_circle_filled),
                      const Icon(Icons.add_box_rounded),
                      InkWell(
                        child: Icon(
                          Icons.colorize,
                        ),
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.yellow.shade100,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.black,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Dark mode sync'),
                                      Switch(
                                        value: light,
                                        activeColor: Colors.amber,
                                        onChanged: (bool value) {
                                          //  setState(() {
                                          //   light = value;
                                          // });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Slider(
                                    value: _currentSliderValue,
                                    max: 100,
                                    divisions: 5,
                                    label:
                                        _currentSliderValue.round().toString(),
                                    onChanged: (double value) {
                                      // setState(() {
                                      //   _currentSliderValue = value;
                                      // });
                                    },
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))),
                            );
                          },
                        ),
                      ),
                      Icon(Icons.rotate_left_sharp),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 600,
                    width: 200,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2))),
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          onChanged: (String value) {
                            // Handle user input
                          },
                        );
                      },
                      itemCount: 36,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black12,
                  child: Column(children: [
                    Icon(Icons.undo),
                    Text("undo"),
                  ]),
                ),
                Container(
                  color: Colors.black12,
                  child: Column(children: [
                    Icon(Icons.phonelink_erase),
                    Text("Erase"),
                  ]),
                ),
                Container(
                  color: Colors.black12,
                  child: Column(children: [
                    Icon(Icons.draw),
                    Text("Pencil"),
                  ]),
                ),
                Container(
                  color: Colors.black12,
                  child: Column(children: [
                    Icon(Icons.lightbulb),
                    Text("Hint"),
                  ]),
                )
              ],
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: TabMenu.values
            .map((e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.txt,
                ))
            .toList(),
        onTap: (int index) {
          final selectedTab = TabMenu.values[index];
          onSelected(context, selectedTab);
        },
      ), //
    );
  }

  // void _showMaterialDialog() {
  //   showDialog(
  //       context: context(),
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Material Dialog'),
  //           content: Text('Hey! I am Coflutter!'),
  //           actions: <Widget>[
  //             TextButton(
  //                 onPressed: () {
  //                   _dismissDialog();
  //                 },
  //                 child: Text('Close')),
  //             TextButton(
  //               onPressed: () {
  //                 print('HelloWorld!');
  //                 _dismissDialog();
  //               },
  //               child: Text('HelloWorld!'),
  //             )
  //           ],
  //         );
  //       });
  // }

  // _dismissDialog() {
  //   Navigator.pop(context());
  // }
}
