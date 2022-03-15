import 'homepage.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 240,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade700),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsConditions(name: companyController.toString()),),);
                  if (isAgreed == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const Wait()),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Agree to Terms and Conditions to  Continue'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 98,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white24,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isAgreed = !isAgreed;
                  });
                },
                icon: Icon(
                  !isAgreed
                      ? Icons.check_box_outline_blank_rounded
                      : Icons.check_box_rounded,
                  color: Colors.white,
                ),
              ),
              const Text(
                'I agree to the terms and conditions',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class Wait extends StatefulWidget {
  const Wait({Key? key}) : super(key: key);

  @override
  State<Wait> createState() => _WaitState();
}

class _WaitState extends State<Wait> {
  @override
  Widget build(BuildContext context) {
    bool isVerified = true;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: !isVerified,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      strokeWidth: 12,
                      color: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                !isVerified
                    ? 'Please Wait, You are Being Verifed At The Moment...'
                    : 'You have Been verifed,\nThank You for Waiting, You May Continue',
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Visibility(
              visible: isVerified,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.amberAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const SizedBox(
                  height: 40,
                  width: 150,
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
