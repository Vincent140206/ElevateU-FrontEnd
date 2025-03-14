import 'package:elevateu_bcc_new/features/category/bloc/category_bloc.dart';
import 'package:elevateu_bcc_new/features/category/bloc/category_event.dart';
import 'package:elevateu_bcc_new/features/skillChallenge/bloc/scBloc.dart';
import 'package:elevateu_bcc_new/features/skillChallenge/bloc/scEvent.dart';
import 'package:elevateu_bcc_new/widgets/ElevatedButton.dart';
import 'package:elevateu_bcc_new/widgets/TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController groupIdController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  TextEditingController categoryIdController = TextEditingController();
  TextEditingController titleGController = TextEditingController();
  TextEditingController descriptionGController = TextEditingController();

  TextEditingController kategoryController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? thumbnail;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        thumbnail = pickedFile;
      });
    }
  }
  String? categoryId;
  String? categoryName;

  Future<Map<String, String?>> getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');
    String? name = prefs.getString('name');
    return {
      'id': id,
      'name': name,
    };
  }

  void _loadCategory() async {
    Map<String, String?> category = await getCategory();
    setState(() {
      categoryId = category['id'];
      categoryName = category['name'];
    });
    debugPrint('Category ID: $categoryId');
    debugPrint('Category Name: $categoryName');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Create Challenge"),
                SizedBox(height: 8,),
                TextFields(
                    controller: groupIdController,
                    hintText: 'group id',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: titleController,
                    hintText: 'title',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: subtitleController,
                    hintText: 'subtitle',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: descriptionController,
                    hintText: 'desc',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: difficultyController,
                    hintText: 'difficulty',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: statusController,
                    hintText: 'status',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                Elevatedbutton1(
                    tulisan: 'kirim',
                    onPressed: (){
                      final groupId = groupIdController.text;
                      final title = titleController.text;
                      final subtitle = subtitleController.text;
                      final description = descriptionController.text;
                      final difficulty = difficultyController.text;
                      final status = statusController.text;

                      context.read<SkillChallengeBloc>().add(CreateSkillChallenge(
                        groupId: groupId,
                        title: title,
                        subtitle: subtitle,
                        description: description,
                        difficulty: difficulty,
                        isFree: (status == 'false') ? false : true  ,
                      ));
                    },
                    width: double.infinity,
                    height: 48
                ),
                SizedBox(height: 50,),
                Text("Create Challenge Group"),
                SizedBox(height: 8,),
                TextFields(
                    controller: categoryIdController,
                    hintText: 'category id',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: titleGController,
                    hintText: 'title',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                TextFields(
                    controller: descriptionGController,
                    hintText: 'desc',
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick an Image'),
                ),
                Elevatedbutton1(
                    tulisan: 'kirim',
                    onPressed: (){
                      final category_Id = categoryIdController.text;
                      final title = titleGController.text;
                      final description = descriptionGController.text;
                      final thumbnailPath = thumbnail?.path ?? '';

                      context.read<SkillChallengeBloc>().add(CreateSkillChallengeGroup(
                        category_id: category_Id,
                        title: title,
                        description: description,
                        thumbnail: thumbnailPath,
                      ));
                    },
                    width: double.infinity,
                    height: 48
                ),
                SizedBox(height: 50,),
                Text("Create Kategory"),
                TextFields(
                    controller: kategoryController,
                    hintText: "kategory",
                    obscureText: false,
                    color: Colors.transparent,
                    borderColor: Colors.black,
                    enabled: true
                ),
                Elevatedbutton1(
                    tulisan: 'submit',
                    onPressed: (){
                      final name = kategoryController.text;
                      context.read<CategoryBloc>().add(CreateCategoryRequested(name: name));
                    },
                    width: double.infinity,
                    height: 48
                ),
                SizedBox(height: 50,),
                Text("get categori id"),
                TextButton(onPressed: (){
                  _loadCategory();
                }, child: Text('get')),
                Text("Category ID: $categoryId"), // Display loaded category ID
                Text("Category Name: $categoryName")
              ],
            ),
          ),
        ),
    );
  }
}
