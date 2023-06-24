import 'package:get/get.dart';
import 'package:visitbogor/app/data/wisata_model.dart';
import 'package:visitbogor/app/modules/home/services/home_services.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var isLoading2 = true.obs;
  var wisataList = <WisataModel>[].obs;
  var popularList = <WisataModel>[].obs;

  void fetchPopular() async {
    try {
      isLoading2(true);
      var data = await HomeServices.fetchPopular();
      if (data != null) {
        popularList.value = data;
      }
    } finally {
      isLoading2(false);
    }
  }

  void fetchTop() async {
    try {
      isLoading(true);
      var data = await HomeServices.fetchTop();
      if (data != null) {
        wisataList.value = data;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchKategori(String id) async {
    try {
      isLoading(true);
      var data = await HomeServices.fetchKategori(id);
      if (data != null) {
        wisataList.value = data;
      }
    } finally {
      isLoading(false);
    }
  }

  void updateHitCount(String id) async {
    await HomeServices.updateCount(id);
  }

  @override
  void onInit() {
    fetchPopular();
    fetchTop();
    //fetchKategori("1");
    super.onInit();
  }
}
