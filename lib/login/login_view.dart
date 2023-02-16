import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

TextEditingController emailCtrl = TextEditingController();
TextEditingController passwordCtrl = TextEditingController();

class _LoginViewState extends State<LoginView> {
  var animationLink = 'assets/login.riv';
  late SMITrigger failTriger, successTrigger;
  late SMIBool isChecking, isHandUp;
  late SMINumber lookNum;
  Artboard? artboard;
  late StateMachineController? stateMachineController;
  @override
  void initState() {
    super.initState();
    initArtboard(); //start animation process
  }

  initArtboard() {
    rootBundle.load(animationLink).then((value) {
      final file = RiveFile.import(value);
      final art = file.mainArtboard;
      // stateMachineController =StateMachineController.fromArtboard(art,'Login Machine')!;
      stateMachineController =
          StateMachineController.fromArtboard(art, "Login Machine")!;
      setState(() {
        artboard = art;
      });
      if (stateMachineController != null) {
        art.addController(stateMachineController!);
        // for(var element in stateMachineController!.inputs){print(element.name);}

        for (var element in stateMachineController!.inputs) {
          if (element.name == "isChecking") {
            isChecking = element as SMIBool;
          } else if (element.name == "isHandsUp") {
            isHandUp = element as SMIBool;
          } else if (element.name == 'trigSuccess') {
            successTrigger = element as SMITrigger;
          } else if (element.name == 'trigFail') {
            failTriger = element as SMITrigger;
          } else if (element.name == 'numLook') {
            lookNum = element as SMINumber;
          }
        }
      }
    });
  }

  checking() {
    isHandUp.change(false);
    isChecking.change(true);
    lookNum.change(0);
  }

  moveEyes(value) {
    lookNum.change(value.length.toDouble());
  }

  handsup() {
    isHandUp.change(true);
    isChecking.change(false);
  }

  login() {
    isHandUp.change(false);
    isChecking.change(false);
    if (emailCtrl.text == 'admin' && passwordCtrl.text == 'admin') {
      successTrigger.fire();
    } else {
      failTriger.fire();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //______LOGIN TEXT

            if (artboard != null)
              SizedBox(
                height: 350,
                width: 400,
                child: Rive(
                  artboard: artboard!,
                ),
              ),
            //______CONTAINER FOR EMAIL
            SizedBox(
              height: 10,
            ),
            Text(
              'Login View',
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.purple,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10.0)),
              child: InkWell(
                child: TextField(
                  onTap: checking,
                  onChanged: ((value) => moveEyes(value)),

                  //controller: emailCtrl,
                  decoration:const InputDecoration(
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    border: InputBorder.none,
                  ),
                  style:const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            //______CONTAINER FOR PASSWORD
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                controller: passwordCtrl,
                onTap: handsup,
                decoration:const InputDecoration(
                  hintText: 'Enter Your Password',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                  border: InputBorder.none,
                ),
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            //______CONTAINER FOR BOTTON
            ElevatedButton(style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding:  EdgeInsets.all(12),
            ),
              onPressed: login, child:const Text('Login'),),

          ],
        ),
      ),
    );
  }
}
