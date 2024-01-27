import 'package:aivr/src/enum/request_status.dart';
import 'package:aivr/src/model/user_model.dart';
import 'package:aivr/src/repository/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Login Page'),
        // ),
        body: SizedBox.expand(
      child: FractionallySizedBox(
          heightFactor: 0.8,
          child: SingleChildScrollView(
            child: LoginForm(),
          )),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final usernameInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  bool _pressedEnter = false;
  bool _obscurePassword = true;
  String _errorMessage = "";

  void _formSubmit(BuildContext context) async {
    // if user has already submitted form, do nothing.
    if (_pressedEnter) return;

    String errorMessage = "";
    String username = usernameInputController.text;
    String password = passwordInputController.text;
    setState(() {
      _pressedEnter = true;
      _errorMessage = errorMessage;
    });
    if (username == "" || password == "") {
      errorMessage = "Please enter username and password.";
    } else {
      bool success = await UserRepository.testLogin(username, password);
      if (success) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 5),
            content: Consumer<UserModel>(builder: (context, user, child) {
              return Text('Selamat datang, ${user.username}');
            })));
        assert(UserModel().isLoggedIn == true);
        Future.delayed(Duration(seconds: 1));
        // ignore: use_build_context_synchronously
        GoRouter.of(context).goNamed('home');
      } else {
        errorMessage = "Credentials error";
      }
    }
    // reset form
    setState(() {
      _pressedEnter = false;
      _errorMessage = errorMessage;
    });
  }

  Widget LoginButton() {
    return Container(
      child: ElevatedButton(
        onPressed: () async {},
        child: const Text('Login'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.amber,
      child: Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          // Pressing enter in the field will now move to the next field.
          SingleActivator(LogicalKeyboardKey.arrowDown): NextFocusIntent(),
          SingleActivator(LogicalKeyboardKey.arrowUp): PreviousFocusIntent(),
        },
        child: FocusTraversalGroup(
            child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: () {
                  Form.of(primaryFocus!.context!).save();
                },
                child: Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Lem Fox Logo
                        Flexible(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.all(50.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child:
                                    Image.asset('assets/images/logo_fox.png'),
                              )),
                        ),
                        // Login Form Area
                        Flexible(
                            flex: 3,
                            child: Column(children: [
                              // USERNAME
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ConstrainedBox(
                                  constraints:
                                      BoxConstraints.tight(const Size(200, 50)),
                                  child: TextFormField(
                                    controller: usernameInputController,
                                    autocorrect: false,
                                    enabled: !_pressedEnter,
                                    decoration: InputDecoration(
                                        hintText: "Username",
                                        border: UnderlineInputBorder()),
                                    validator: (value) {
                                      debugPrint('Validating field username');
                                      // username field validator
                                    },
                                    onSaved: (String? value) {
                                      debugPrint(
                                          'Value for field username saved as "$value"');
                                    },
                                  ),
                                ),
                              ),
                              //PASSWORD
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ConstrainedBox(
                                  constraints:
                                      BoxConstraints.tight(const Size(200, 50)),
                                  child: TextFormField(
                                    enabled: !_pressedEnter,
                                    controller: passwordInputController,
                                    obscureText: _obscurePassword,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            iconSize: 20.0,
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _obscurePassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
                                              });
                                            }),
                                        hintText: "Password",
                                        border: UnderlineInputBorder()),
                                    autocorrect: false,
                                    validator: (value) {
                                      debugPrint('Validating field password');
                                      // username field validator
                                    },
                                    onSaved: (String? value) {
                                      debugPrint(
                                          'Value for field password saved as "$value"');
                                    },
                                  ),
                                ),
                              ),
                              //Login Button & error message text
                              Column(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5.0),
                                      child: _pressedEnter
                                          ? SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                  strokeWidth: 4))
                                          : Text(_errorMessage,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red))),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: ElevatedButton(
                                        onPressed: () => _formSubmit(context),
                                        child: const Text('Sign In'),
                                      ))
                                ],
                              )
                            ]))
                      ]),
                ))),
      ),
    );
  }
}
