import 'package:elevateu_bcc_new/widgets/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/category/bloc/category_bloc.dart';
import '../features/category/bloc/category_event.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create new category"),
              SizedBox(height: 8,),
              TextFields(
                  controller: categoryController,
                  hintText: 'Category',
                  obscureText: false,
                  color: Colors.transparent,
                  borderColor: Colors.black,
                  enabled: true
              ),
              ElevatedButton(
                  onPressed: (){
                    String categoryName = categoryController.text;
                    BlocProvider.of<CategoryBloc>(context).add(CreateCategoryRequested(name: categoryName));
                  },
                  child: Text('Submit')
              )
            ],
          ),
        ),
      )
    );
  }
}
