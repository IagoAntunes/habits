import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habits/core/colors/colors.dart';
import 'package:habits/src/models/task_model.dart';
import 'package:uuid/uuid.dart';

class NewTaskPage extends StatelessWidget {
  NewTaskPage({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Criar Tarefa',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Qual sua tarefa ?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xff18181B),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  border: Border.all(
                    width: 2,
                    color: AppColors.greymed,
                  ),
                ),
                child: TextField(
                  controller: controller,
                  style: TextStyle(color: AppColors.greyLight),
                  decoration: InputDecoration(
                    hintText: 'Estudar, correr, etc...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: AppColors.greyLight),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green),
                  onPressed: () async {
                    TaskModel task = TaskModel(
                      id: const Uuid().v1(),
                      description: controller.text,
                      date: DateTime.now(),
                      isFinished: false,
                    );
                    await firestore
                        .collection('habits')
                        .doc(task.id)
                        .set(task.toMap());
                    Navigator.pop(context, task);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      SizedBox(width: 5),
                      Text(
                        "Confirmar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
