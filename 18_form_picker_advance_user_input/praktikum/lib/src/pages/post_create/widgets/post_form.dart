import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:praktikum/src/model/post_mode.dart';
import 'package:praktikum/src/pages/post_create/widgets/textarea.dart';
import 'package:praktikum/src/pages/post_preview/post_preview_page.dart';
import '../../../util/intent_pro.dart';
import '../../../widgets/outline_button_pro.dart';
import '../../../widgets/button_pro.dart';
import 'image_frame.dart';
import 'label.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => PostFormState();
}

class PostFormState extends State<PostForm> {
  File? fileImage;
  String? pickFile;
  String? textDateNow;
  String? textColorHex;
  DateTime? currentDate;
  Color color = Colors.blue;

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 10),
        const Label('Cover'),
        imagePreview(),
        const SizedBox(height: 8),
        ButtonPro(
          onPressed: pickFileAction,
          title: pickFile ?? 'Pilih File',
          background: Colors.grey.shade600,
        ),
        const SizedBox(height: 16),
        const Label('Publish At'),
        OutlineButtonPro(
          onPressed: pickDateAction,
          title: textDateNow ?? 'dd/mm/yyyy',
        ),
        const SizedBox(height: 16),
        colorPreviewAndTitle(),
        const SizedBox(height: 8),
        OutlineButtonPro(
          onPressed: pickColorAction,
          title: textColorHex ?? 'Pick a color',
        ),
        const SizedBox(height: 16),
        const Label('Caption'),
        Textarea(
          controller: textController,
          padding: const EdgeInsets.all(16),
          maxLines: 10,
        ),
        const SizedBox(height: 16),
        Center(
          child: ButtonPro(
            width: 150,
            onPressed: saveAction,
            title: 'Simpan',
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  /// Pick File Action
  void pickFileAction() async {
    final file = await FilePicker.platform.pickFiles();
    if (file == null) return;

    final pathImage = file.files.first.path;
    if (pathImage == null) return;

    setState(() {
      fileImage = File(pathImage);
      pickFile = file.files.first.name;
    });
  }

  /// Pick Date Action
  void pickDateAction() async {
    final dateTimeNow = DateTime.now();
    final pickDateNow = await showDatePicker(
      context: context,
      initialDate: dateTimeNow,
      firstDate: DateTime(1990),
      lastDate: DateTime(dateTimeNow.year + 5),
    );

    setState(() {
      currentDate = pickDateNow;
      if (currentDate == null) return;
      textDateNow = DateFormat('dd/MM/yyyy').format(currentDate!);
    });
  }

  /// Pick color action
  void pickColorAction() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: color,
              onColorChanged: (Color newColor) {
                var hex = color
                    .toString()
                    .substring(10, color.toString().length - 1)
                    .toUpperCase();

                setState(() {
                  color = newColor;
                  textColorHex = '#$hex';
                });
              },
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
              ),
              onPressed: () {
                IntentPro(context).finish();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void saveAction() {
    if (fileImage == null) return;
    if (currentDate == null) return;
    if (textController.text.isEmpty) return;

    final post = PostModel(
      fileImage: fileImage!,
      dateTime: currentDate!,
      color: color,
      text: textController.text,
    );

    IntentPro(context).startActivity(
      PostPreviewPage(post: post),
    );
  }

  // Color preview and label
  Widget colorPreviewAndTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Label('Color Theme', bottom: 0),
        Container(
          width: 60,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }

  /// Image Preview Frame
  Widget imagePreview() {
    if (fileImage == null) {
      return ImageFrame(
        content: Icon(
          Icons.image,
          size: 80,
          color: Colors.grey.shade500,
        ),
      );
    }

    return ImageFrame(
      content: Image(
        image: FileImage(fileImage!),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }
}
