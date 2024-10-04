import 'dart:async';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//changes
class PregnancyItemController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  var al_firstTrimester = [].obs;
  var al_secondTrimester=[].obs;
  var al_thirdTrimester=[].obs;
  var al_afterPregnancy=[].obs;

  @override
  void onInit() async {
    super.onInit();

    al_firstTrimester.add({
      'image': "icons/parentalvitamin.webp",
      'link': "https://amzn.to/3vNeigA",
      'name': "Prenatal \nvitamins",
    });

    al_firstTrimester.add({
      'image': "icons/strech_mark.jpg",
      'link': "https://amzn.to/3Jm2u86",
      'name': "Stretch mark \nprevention",
    });
    al_firstTrimester.add({
      'image': "icons/nausia.webp",
      'link': "https://amzn.to/3Jr8oEW",
      'name': "Anti nausea \nband",
    });

    //Second trimester
    al_secondTrimester.add({
      'image': "icons/mpillow.webp",
      'link': "https://amzn.to/3U40g23",
      'name': "Maternity \nPillow",
    });
    al_secondTrimester.add({
      'image': "icons/mbra.webp",
      'link': "https://amzn.to/49I70Z5",
      'name': "Maternity \nBra",
    });
    al_secondTrimester.add({
      'image': "icons/mband.webp",
      'link': "https://amzn.to/4aHwp6y",
      'name': "Maternity Belly \nBand",
    });
    al_secondTrimester.add({
      'image': "icons/mdress.webp",
      'link': "https://amzn.to/3Q8zrZu",
      'name': "Pregnancy \nClothes",
    });

    //Third trimester
    al_thirdTrimester.add({
      'image': "icons/bball.webp",
      'link': "https://amzn.to/445aDao",
      'name': "Yoga \nball",
    });
    al_thirdTrimester.add({
      'image': "icons/bcloths.webp",
      'link': "https://amzn.to/3w2eqc3",
      'name': "New born \nclothes",
    });
    al_thirdTrimester.add({
      'image': "icons/bdiaper.webp",
      'link': "https://amzn.to/3vOB7Ax",
      'name': "New \ndiapers",
    });
    al_thirdTrimester.add({
      'image': "icons/bcrib.webp",
      'link': "https://amzn.to/3xIEqd0",
      'name': "Baby \ncrib",
    });
    al_thirdTrimester.add({
      'image': "icons/bchanging.webp",
      'link': "https://amzn.to/4b4Smwl",
      'name': "Baby changing \nessentials",
    });
    al_thirdTrimester.add({
      'image': "icons/bmonitor.webp",
      'link': "https://amzn.to/444ieGk",
      'name': "Baby \nmonitors",
    });
    al_thirdTrimester.add({
      'image': "icons/bstaler.webp",
      'link': "https://amzn.to/3UoVP3a",
      'name': "Stroller",
    });
    al_thirdTrimester.add({
      'image': "icons/bseat.webp",
      'link': "https://amzn.to/4awH3wZ",
      'name': "Car seat",
    });
    al_thirdTrimester.add({
      'image': "icons/bswing.webp",
      'link': "https://amzn.to/49LqAUt",
      'name': "Baby swing",
    });
    al_thirdTrimester.add({
      'image': "icons/bnpilo.webp",
      'link': "https://amzn.to/3U1A5cp",
      'name': "Nurseing \nPillow",
    });
    al_thirdTrimester.add({
      'image': "icons/bsucker.webp",
      'link': "https://amzn.to/4480MRb",
      'name': "Breastfeeding \nPump",
    });
    al_thirdTrimester.add({
      'image': "icons/stralizerb.webp",
      'link': "https://amzn.to/3JqNNAE",
      'name': "Bottle \nsterilizer",
    });
    al_thirdTrimester.add({
      'image': "icons/bwarmr.webp",
      'link': "https://amzn.to/3JouszV",
      'name': "Feeding \nBottles",
    });
    al_thirdTrimester.add({
      'image': "icons/bwarere.webp",
      'link': "https://amzn.to/3w2fjRV",
      'name': "Bottle \nwarmer",
    });
    al_thirdTrimester.add({
      'image': "icons/bcarrie.webp",
      'link': "https://amzn.to/3vZTceQ",
      'name': "Baby carrier",
    });
    al_thirdTrimester.add({
      'image': "icons/bmlks.webp",
      'link': "https://amzn.to/3vVdUwt",
      'name': "Breast milk \nstorgae pouch",
    });
    al_thirdTrimester.add({
      'image': "icons/bppcloths.webp",
      'link': "https://amzn.to/3vVdUwt",
      'name': "Feeding \nclothes",
    });

    //After delivery
    al_afterPregnancy.add({
      'image': "icons/warmbag.webp",
      'link': "https://amzn.to/3QM5TB3",
      'name': "Hot water \nbottle",
    });
    al_afterPregnancy.add({
      'image': "icons/bupc.webp",
      'link': "https://amzn.to/3wAvVjW",
      'name': "Burp \nclothes",
    });
    al_afterPregnancy.add({
      'image': "icons/ctowel.webp",
      'link': "https://amzn.to/4dBJosv",
      'name': "Baby \nblanket",
    });
    al_afterPregnancy.add({
      'image': "icons/napieec.webp",
      'link': "https://amzn.to/3WznXCi",
      'name': "Cotton \nnappies",
    });
    al_afterPregnancy.add({
      'image': "icons/bdiaper.webp",
      'link': "https://amzn.to/3vOB7Ax",
      'name': "New \ndiapers",
    });
  }

  @override
  void onReady() async {
    super.onReady();
  }
}
