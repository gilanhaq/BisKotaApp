import 'package:biskota/cubit/auth_cubit.dart';
import 'package:biskota/screens/widgets/custom_button.dart';
import 'package:biskota/screens/widgets/custom_text_field.dart';
import 'package:biskota/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Sign In with your\nexisting account',
          style: blackText.copyWith(
            fontSize: 24,
            fontWeight: semibold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextField(
          title: 'Email Address',
          hint: 'susilojoko@email.com',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextField(
          title: 'Password',
          hint: 'min 8 character',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: error,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              margin: const EdgeInsets.only(top: 24),
              title: 'Sign In',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
            );
          },
        );
      }

      Widget signUpButton() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 73,
            ),
            child: Text(
              'Don\'t have an account? Sign Up',
              style: greyText.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: backgroud,
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
            signUpButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroud,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
