part of 'pages.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String _emailController = '';
  String _passwordController = '';

  //key form
  final _formKey = GlobalKey<FormState>();

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            width: 150,
            child: Image.asset("assets/images/ic_logo_big.png"),
          ),
          Center(
            child: Text(
              "SMAGA APPS",
              style: blueTextStyleInter.copyWith(fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }

  Widget formData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 50,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xffBC219E),
                ),
                hintText: 'Masukan email anda',
                labelText: 'email',
                labelStyle: TextStyle(
                  color: Color(0xffBC219E),
                ),
                hintStyle: TextStyle(
                  color: Color(0xffBC219E),
                ),
              ),
              onSaved: (value) {
                _emailController = value!;
              },
              validator: (value) {
                return (value == "") ? 'Inputan tidak boleh kosong!' : null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.key,
                  color: Color(0xffBC219E),
                ),
                hintText: 'Masukan password anda',
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color(0xffBC219E),
                ),
                hintStyle: const TextStyle(
                  color: Color(0xffBC219E),
                ),
                suffix: InkWell(
                  onTap: _toggle,
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    size: 15.0,
                    color: const Color(0xffBC219E),
                  ),
                ),
              ),
              onSaved: (value) {
                _passwordController = value!;
              },
              validator: (value) {
                return (value == "") ? 'Inputan tidak boleh kosong!' : null;
              },
              obscureText: _obscureText,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            header(),
            formData(),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Berhasil melakukan login"),
                      ),
                    );
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main-page', (route) => false);
                  } else if (state is AuthLoginFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoginLoding) {
                    return const Center(
                      child: SpinKitFadingCircle(
                        color: Color(0xffBC219E),
                        size: 50,
                      ),
                    );
                  }
                  return ButtonWidget(
                    title: "Login",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthCubit>().signIn(
                              email: _emailController,
                              password: _passwordController,
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            content:
                                Text("Lakukan pengisian form dengan benar!"),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
