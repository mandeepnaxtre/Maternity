import 'dart:async';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pregnacyv1/main.dart';
import 'package:pregnacyv1/utils/app_constants.dart';
import 'package:pregnacyv1/utils/app_extensions.dart';

//changes
class LoginController extends GetxController {
  final loading = false.obs;
  final showLogin = false.obs;
  late Box dailyUpdateData;
  @override
  void onInit() async {
    super.onInit();

    dailyUpdateData = await Hive.openBox(Constants.UPDATE_DATA);
    dailyUpdate();
  }

  @override
  void onReady() async {
    super.onReady();

  }
  void dailyUpdate(){
    dailyUpdateData.put(1, [
      "Congratulations on the start of your incredible journey! Pregnancy begins smoothly in the first week, and your baby is forming into life. Although symptoms do not appear too early, your body is getting ready for the incredible changes that are coming. Drink enough water and eat a well-balanced diet to maintain your health and your baby's growth."
    ]);
    dailyUpdateData.put(2, [
      "Missed periods and implantation bleeding (light spotting) are very early signs of week 2nd of pregnancy. Hopefully, you're done with your period and will start ovulating soon, so you're not pregnant at two weeks. You're close, though!"
    ]);
    dailyUpdateData.put(3, [
      "Congratulations! Your fertilized egg is now traveling into your fallopian tube, dividing and redividing into identical cells on their way to your uterus. "
    ]);
    dailyUpdateData.put(4, [
      "At 4 weeks pregnant, the size of your baby is like a poppy seed. Your baby is practically microscopic, but it is going through some major developments. Cells are dividing really fast, so digestion is just one of many bodily systems they're forming."
    ]);
    dailyUpdateData.put(5, [
      "Yeah, your embryo is now measurable- it's just 0.3 cm from crown to rump (head to bum) at week five, and the baby's getting ready to grow. Their size will almost double next week. Grow, baby, grow!"
    ]);
    dailyUpdateData.put(6, [
      "Wow! Your baby is growing rapidly and changing all the time. At week six, your baby is the size of a pomegranate seed. The baby is getting everything it needs from you for healthy growth."
    ]);
    dailyUpdateData.put(7, [
      "Amazingly, Your baby grows quickly, producing 100 new brain cells every minute. Your baby's arm bud developed just last week and has a hand at the end, which looks like a paddle. You just dream about playing ball with your baby someday.Nausea is common this week. Drink more water and eat foods that contain a lot of fiber, such as vegetables and fruits."
    ]);
    dailyUpdateData.put(8, [
      "Every week, you will exceed new accomplishments in your pregnancy. This week, the placenta is still developing and producing features that help connect it to the womb while the fetus remains inside its embryonic bag. Your baby's lips, eyelids, and nose would have started to form.  "
    ]);
    dailyUpdateData.put(9, [
      "Now that you are nine weeks, the first trimester is almost over. Inside your week 9 pregnant belly, the cute facial features your baby is developing, a little mouth, and even a tongue with tiny taste buds. The eyes are larger, more noticeable, and contain some pigment or color.At this week, your baby’s heart is also growing larger and developing quickly."
    ]);
    dailyUpdateData.put(10, [
      "Feeling Exhaust? Don't worry; pregnancy in the 10th week can be a sign of relief from morning sickness for some.Your precious is barely 3.1 cm and weighs around 4 grams. As each day of this week progresses, your baby will keep growing a little more. Your belly is going to get rounder.Your baby's heart is now fully formed. The formation of the jawbone, structure of the brain/head, and the mass of which will grow. The other features that will be formed by now are the legs, stomach, pelvis, and bones."
    ]);
    dailyUpdateData.put(11, [
      "The baby is moving fluidly and gracefully inside your 11-week pregnant belly. Baby's head is growing. Tooth buds, hair follicles, and nail beds are also forming. Cool, huh?!The brain and nervous system are almost done developing. Muscles and nerves begin to work together. This means your baby is starting to make small movements. It's too early for you to feel them.\nAfter all, your body is growing another human being in the form of your little baby. So you need to eat well, take naps whenever possible, take breaks when you're wiped out, and engage in pregnancy-safe exercises like walking!"
    ]);
    dailyUpdateData.put(12, [
      "At week 12, your baby is now about the size of a lime, and hopefully, you are starting to feel much better as the 1 trimester nears an end.\nAlso, this is a big week for your baby as your little one's key body systems have formed. Your baby's digestive system and kidneys are starting to function. Now, your baby's legs are still tiny, their head is about half the length of your baby's body, and arms seem to be a more proper length."
    ]);
    dailyUpdateData.put(13, [
      "Congratulations! Your bump is starting to show. Your baby's digestive system and liver have started to work. Vocal cord development is ongoing. Soft, fuzzy hair forms on your baby's head and eyebrows, forming their bones.\nIf you have a boy, his testicles are developed; if you have a girl, her ovaries are fully formed. Your 20th-week ultrasound will tell you exactly whether it's a boy or a girl!"
    ]);
    dailyUpdateData.put(14, [
      "Hurrah! The second trimester is starting! This stage relieves, but the discomfort you felt in the past few weeks will soon return in the third trimester.\nA few fine hairs have grown on your baby's face by this week. Your baby's body will be covered with this silky, colorless hair lanugo, which sheds just before delivery.\nWith pregnancy week 14, you can start exercising, getting to-dos done, and having fun. Enjoy!"
    ]);
    dailyUpdateData.put(15, [
      "As your pregnancy progresses, you will feel more energetic, and your libido will be restored, so you may start craving action. You can rest easy knowing your little one won't be affected.\nYour baby's immune system may be slowly developing, but for good reason. While your baby's immune system is still busy developing its own army of white blood cells, this allows your own immune system to calm down and accept that you are not a threat to your health."
    ]);

    dailyUpdateData.put(16, ["No data available"]);
    dailyUpdateData.put(17, ["No data available"]);
    dailyUpdateData.put(18, ["No data available"]);
    dailyUpdateData.put(19, ["No data available"]);
    dailyUpdateData.put(20, ["No data available"]);
    dailyUpdateData.put(21, ["No data available"]);
    dailyUpdateData.put(22, ["No data available"]);
    dailyUpdateData.put(23, ["No data available"]);
    dailyUpdateData.put(24, ["No data available"]);
    dailyUpdateData.put(25, ["No data available"]);
    dailyUpdateData.put(26, ["No data available"]);
    dailyUpdateData.put(27, ["No data available"]);
    dailyUpdateData.put(28, ["No data available"]);
    dailyUpdateData.put(29, ["No data available"]);
    dailyUpdateData.put(30, ["No data available"]);
    dailyUpdateData.put(31, ["No data available"]);
    dailyUpdateData.put(32, ["No data available"]);
    dailyUpdateData.put(33, ["No data available"]);
    dailyUpdateData.put(34, ["No data available"]);
    dailyUpdateData.put(35, ["No data available"]);
    dailyUpdateData.put(36, ["No data available"]);
    dailyUpdateData.put(37, ["No data available"]);
  }
}
