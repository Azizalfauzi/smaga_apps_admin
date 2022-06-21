part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_back_ios),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Profile",
            style: blackTextStyleInter.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget headerImage() {
    return Center(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[100]),
              child: const Icon(
                Icons.person,
                size: 50,
                color: kPrimaryColor,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 70, left: 60),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200]),
              child: const Icon(
                Icons.pin_end,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoginSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 30, left: 18, right: 18),
            child: Column(
              children: [
                InputReadOnly(
                  label: "Nama :",
                  input: state.result.name.toString(),
                ),
                InputReadOnly(
                  label: "Nis :",
                  input: state.result.nis.toString(),
                ),
                const InputReadOnly(
                  label: "Tanggal Lahir :",
                  input: "12 Nopember 1998",
                ),
                InputReadOnly(
                  label: "Kelas :",
                  input: state.result.kelas.toString(),
                ),
              ],
            ),
          );
        } else if (state is AuthLoginFailed) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget buttonLogout() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login-page', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoginLoding) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 60
          ),
          child: ButtonWidget(
            title: "Logout",
            onTap: () {
              context.read<AuthCubit>().signOut();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            headerImage(),
            content(),
            buttonLogout(),
          ],
        ),
      ),
    );
  }
}
