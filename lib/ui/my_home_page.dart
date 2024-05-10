import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bl_part3/bloc/email_bloc.dart';

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerMessage = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Send Email",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 40),
            ),
            TextField(
              controller: controllerName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: controllerEmail,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: controllerMessage,
              maxLines: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Message"),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  BlocProvider.of<EmailBloc>(context).add(SendEmailEvent(
                      email: controllerEmail.text,
                      message: controllerMessage.text,
                      name: controllerName.text));
                },
                child: BlocConsumer<EmailBloc, EmailState>(
                  listener: (context, state) {
                    if (state is SuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("200 OK"),
                        ),
                      );
                    } else if (state is ErrorState) {
                      showBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Text(state.errorText, style: TextStyle(fontSize: 50),),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    }
                    return const Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
