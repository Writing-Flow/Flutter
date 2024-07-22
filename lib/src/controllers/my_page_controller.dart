import 'package:get/get.dart';
import 'package:geulnarae/src/sqlite_db/writing_db.dart';

class MyPageController extends GetxController{
  RxList<Map> myWritingList = <Map>[].obs; // 검색 기록 리스트 controller

  @override
  void onInit() {
    super.onInit();
    _initialData();
  }

  Future<void> _initialData() async {
    await myWritingListSyn(); // 초기 데이터 로드
  }


  // 작문  삭제
  Future<void> deleteMyWriting(int id) async {
    await WritingDb.deleteWriting(id);
    await myWritingListSyn(); // 동기화
  }

  // 내 작문 목록 동기화
  Future<void> myWritingListSyn() async {
    myWritingList.clear();
    myWritingList.assignAll(await WritingDb.selectAll());

  }

}
