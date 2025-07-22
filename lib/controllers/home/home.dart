import 'package:get/get.dart';
import 'package:onelook/controllers/user_controller.dart';
import 'package:onelook/data/models/supplement_model.dart';
import 'package:onelook/data/models/today_dose_item.dart';
import 'package:onelook/data/repository/supplement_repository.dart';
import 'package:onelook/data/utils/time_parser.dart';

class HomeScreenController extends GetxController {
  final SupplementRepository _repository = SupplementRepository();
  final UserController userController = Get.find<UserController>();
  RxList<TodayDoseItem> todayDoses = <TodayDoseItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTodayDoses();
  }

  void _sortTodayDoses() {
    todayDoses.sort((a, b) {
      if (a.isChecked && !b.isChecked) {
        return 1;
      }
      if (!a.isChecked && b.isChecked) {
        return -1;
      }
      final timeA = parseTime(a.time);
      final timeB = parseTime(b.time);
      final timeComparison = timeA.compareTo(timeB);
      if (timeComparison != 0) {
        return timeComparison;
      }
      return a.name.compareTo(b.name);
    });
  }

  Future<void> _loadTodayDoses() async {
    final List<Map<String, dynamic>> fetchedRawData =
        await _repository.getActiveSupplements();
    final DateTime now = DateTime.now();
    final List<TodayDoseItem> tempList = [];

    for (var entry in fetchedRawData) {
      final SupplementModel supplement = entry['supplement'];
      final String docId = entry['docId'];

      final int dayIndex = DateTime(now.year, now.month, now.day)
          .difference(DateTime(supplement.createdAt.year,
              supplement.createdAt.month, supplement.createdAt.day))
          .inDays;

      final trackingForToday = supplement.tracking[dayIndex];

      for (int i = 0; i < supplement.dosageTimes; i++) {
        final bool isChecked = trackingForToday["dose_$i"] ?? false;
        final time = supplement.timeOfDay[i];

        tempList.add(TodayDoseItem(
          docId: docId,
          name: supplement.name,
          form: supplement.form,
          meal: supplement.meal,
          amount: supplement.dosageAmount,
          reminderBefore: supplement.reminderBefore,
          reminderAfter: supplement.reminderAfter,
          doseIndex: i,
          time: time,
          isChecked: isChecked,
          dayIndex: dayIndex,
        ));
      }
    }
    todayDoses.assignAll(tempList);
    _sortTodayDoses();
  }

  Future<void> toggleDoseCheck({
    required String docId,
    required int dayIndex,
    required int doseIndex,
  }) async {
    final doseKey = "dose_$doseIndex";

    final int itemIndex = todayDoses.indexWhere((item) =>
        item.docId == docId &&
        item.dayIndex == dayIndex &&
        item.doseIndex == doseIndex);

    final TodayDoseItem currentItem = todayDoses[itemIndex];
    final bool newIsCheckedState = !currentItem.isChecked;

    await _repository.updateTracking(
        docId, dayIndex, doseKey, newIsCheckedState);

    currentItem.isChecked = newIsCheckedState;

    _sortTodayDoses();
    todayDoses.refresh();
  }

  Future<void> refreshDoses() async {
    await _loadTodayDoses();
  }
}
