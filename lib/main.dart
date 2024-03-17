import 'package:ai_bot_task/common/utils/pref_utils.dart';
import 'package:ai_bot_task/core/api_client.dart';
import 'package:ai_bot_task/features/create_image/create_image_proivder.dart';
import 'package:ai_bot_task/features/create_image/state/createimage_bloc.dart';
import 'package:ai_bot_task/features/gender_selection/states/gender_bloc.dart';
import 'package:ai_bot_task/features/gender_selection/widgets/gender_identity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenderBloc>(

          create: (BuildContext context) => GenderBloc(
            HTTPRequestProvider(),
          ),
        ),
        BlocProvider<ImageTextBloc>(
          create: (BuildContext context) => ImageTextBloc(
            HTTPRequestProvider(),
          ),
        ),
        ChangeNotifierProvider(create: (BuildContext context) => CreateImageProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
          ScreenUtil.init(
            ctx,
            designSize: const Size(375, 812),
          );
          return const GenderIdentityPage();
        }),
      ),
    );
  }
}
