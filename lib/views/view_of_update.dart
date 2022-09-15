import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/update_post_cubit.dart';
import '../model/post_model.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context, Post post, TextEditingController titleController,
    TextEditingController bodyController) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                post = Post(
                  id: post.id,
                  userId: post.id,
                  body: bodyController.text,
                  title: titleController.text,
                );
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
              },
              color: Colors.blue,
              child: const Text(
                "Update a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}
