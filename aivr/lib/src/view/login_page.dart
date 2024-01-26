import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final usernameInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: usernameInputController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: passwordInputController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // send username and password to repository
              }, // No action
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {}, // No action
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        // Pressing enter in the field will now move to the next field.
        SingleActivator(LogicalKeyboardKey.enter): NextFocusIntent(),
      },
      child: FocusTraversalGroup(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            Form.of(primaryFocus!.context!).save();
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Lem Fox Logo
            Flexible(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset('logo_fox.png'),
              ),
            ),
            // Login Form Area
            Flexible(
                flex: 3,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(200, 50)),
                      child: TextFormField(
                        autocorrect: false,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(const Size(200, 50)),
                      child: TextFormField(
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
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Processing Login Data')),
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                ]))
          ]),
        ),
      ),
    ));
  }
}
