import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        backgroundColor: Colors.tealAccent,
        title: Text(
          'FYP App',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(flex: 25, child:
            Row(children: [
              Expanded(
                flex: 50,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('tapping');
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Text('data'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 25,
                child: Row(
                  children: [
                    Card(
                      elevation: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(200),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('tapping');
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Text('data'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
            // ),
            Expanded(
              flex: 25,
              child: Row(children: [
                Expanded(
                  flex: 25,
                  child: Card(
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 25,
                  child: Card(
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 25,
              child: Row(children: [
                Expanded(
                  flex: 25,
                  child: Card(
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 25,
                  child: Card(
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            ),
            //  Expanded(flex: 25, child: Container(color: Colors.black,),),
          ],
        ),
      ),
    );
  }

  cj() {
    Expanded(
      flex: 25,
      child: Card(
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(200),
          ),
        ),
      ),
    );
  }
}
