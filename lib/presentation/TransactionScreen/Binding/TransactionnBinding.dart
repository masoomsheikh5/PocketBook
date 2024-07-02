import 'package:expensetracker/Reposetory/TransanctionnReposetory.dart';
import 'package:expensetracker/presentation/TransactionScreen/Controller/TransuctionController.dart';
import 'package:get/get.dart';


class TransactionnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionnController>(() => TransactionnController(TransactionnRepository()));
  }
}
