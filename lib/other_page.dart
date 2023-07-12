import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text("Home Page"),
        ),
        body: Center(),
=======
        title: const Text("Other Page"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.red,
              height: 300,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                color: Colors.tealAccent,
                height: 400,
              ),
            ),
          ],
        ),
      ),
>>>>>>> develop
    );
  }
}
