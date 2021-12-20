import 'package:books_app/services/auth/signupService.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _aktifStep = 0;
  late String isim, mail, sifre;
  late List<Step> tumStepler;
  bool hata = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF9145B6),
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Theme(
          data: ThemeData(
              backgroundColor: Color(0xFF544179),
              colorScheme: ColorScheme(
                  primary: Color(0xFF544179),
                  background: Colors.white,
                  onBackground: Color(0xFF544179),
                  primaryVariant: Color(0xFF544179),
                  surface: Colors.white,
                  onError: Color(0xFF544179),
                  onPrimary: Color(0xFFEDEAF3),
                  onSecondary: Color(0xFF544179),
                  error: Colors.red,
                  secondaryVariant: Colors.red,
                  onSurface: Colors.red,
                  secondary: Colors.red,
                  brightness: Brightness.light)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stepper(
                  controlsBuilder:
                      (BuildContext context, ControlsDetails control) {
                    return Row(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF544179),
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onPressed: control.onStepContinue,
                          child: const Text('continue'),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF544179),
                            onPrimary: Colors.white,
                            shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onPressed: control.onStepCancel,
                          child: const Text('Back'),
                        ),
                      ],
                    );
                  },
                  currentStep: _aktifStep,
                  steps: tumStepler,
                  onStepContinue: () {
                    setState(() {
                      _ileriButonuKontrolu();
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_aktifStep > 0) {
                        _aktifStep--;
                      } else {
                        _aktifStep = 0;
                      }
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Future<bool> data = UsersignUp(isim, mail, sifre);
                      if (data != true) {
                        print("register error");
                      } else {
                        print("register success");
                      }
                    },
                    child: Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF544179),
                    )),
              ],
            ),
          ),
        ));
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            hintText: "Enter your Username",
            border: OutlineInputBorder(),
            focusedBorder: _focusBorder(),
            enabledBorder: _enableBorder(),
          ),
          // ignore: missing_return
          validator: (entered) {
            if (entered.toString().length < 6) {
              return "Please enter at least 6 characters";
            }
          },
          onSaved: (entered) {
            isim = entered.toString();
          },
        ),
      ),
      Step(
        title: Text("Mail "),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            hintText: "Enter your Email",
            border: OutlineInputBorder(),
            focusedBorder: _focusBorder(),
            enabledBorder: _enableBorder(),
          ),
          // ignore: missing_return
          validator: (entered) {
            if (entered.toString().length < 6 ||
                !entered.toString().contains("@")) {
              return "Please enter valid e-mail address";
            }
          },
          onSaved: (entered) {
            mail = entered!;
          },
        ),
      ),
      Step(
        title: Text("Password"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            hintText: "Enter your Password",
            border: OutlineInputBorder(),
            focusedBorder: _focusBorder(),
            enabledBorder: _enableBorder(),
          ),
          // ignore: missing_return
          validator: (entered) {
            if (entered.toString().length < 6) {
              return "The password should be 6 characters at least!";
            }
          },
          onSaved: (entered) {
            sifre = entered.toString();
          },
        ),
      ),
    ];

    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else
      return StepState.complete;
  }

  void _ileriButonuKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;

      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;

      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    debugPrint("Girilen değerler : isim=>$isim mail=>$mail şifre=>$sifre");
  }

  _focusBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9145B6)),
      borderRadius: BorderRadius.circular(16.0),
    );
  }

  _enableBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF9145B6)),
      borderRadius: BorderRadius.circular(16.0),
    );
  }
}
