import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_us/nav_bar/bottom_nav_bar.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _codeControllers =
      List.generate(4, (index) => TextEditingController());
  bool _isResendButtonEnabled = false;
  int _resendCountdown = 58;
  Timer? _resendTimer;

  @override
  void initState() {
    super.initState();
    startResendCountdown();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void startResendCountdown() {
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _resendCountdown--;
        _isResendButtonEnabled = _resendCountdown == 0;
      });

      if (_resendCountdown == 0) {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    setState(() {
      _resendCountdown = 58;
      _isResendButtonEnabled = false;
      startResendCountdown();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/balloons.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Enter the verification code',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 4; i++)
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: TextField(
                                  controller: _codeControllers[i],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1, 
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    counterText: '', 
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Resend code available in ',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '$_resendCountdown seconds',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 11, 0, 0)),
                        ),
                        TextButton(
                          onPressed: _isResendButtonEnabled ? resendCode : null,
                          child: const Text(
                            'Resend',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        
                        String code = _codeControllers
                            .map((controller) => controller.text)
                            .join();
                        print("Entered Code: $code");
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(color: Color.fromARGB(255, 24, 73, 64)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
