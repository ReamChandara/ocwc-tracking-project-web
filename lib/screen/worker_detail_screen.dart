import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/controller/new_worker_controller.dart';

class WorkerDetailScreen extends GetView<NewWorkerController> {
  const WorkerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Worker Detail"),
      ),
      body: GetBuilder<NewWorkerController>(builder: (workerController) {
        if (workerController.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SizedBox(
            child: Text(
              workerController.param,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }
      }),
    );
  }
}
