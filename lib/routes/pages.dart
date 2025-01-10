import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class AppPages {
  AppPages._();

  static final router = GoRouter(
    routes: <RouteBase>[
      // GoRoute(
      //   path: Routes.HOME,
      //   builder: (context, state) => MusicScreen(searchRoute: (){},),
      //   routes:  const <RouteBase>[
      //
      //     // GoRoute(
      //     //   path: Paths.SONGDETAILS,
      //     //   name: Routes.SONGDETAILS,
      //     //   builder: (context, state) {
      //     //     return BlocProvider<HomeCubit>(
      //     //       create: (_) => serviceLocator<HomeCubit>(),
      //     //       child: SongDetailScreen(),
      //     //     );
      //     //   },
      //     // ),
      //     // GoRoute(
      //     //   path: Routes.CUSTOMPAGE,
      //     //   name: Routes.CUSTOMPAGE,
      //     //   builder: (context, state) => const CustomPage(),
      //     //     routes: [
      //     //       GoRoute(
      //     //           path: Paths.PAGEPREVIEW,
      //     //           name: Routes.PAGEPREVIEW,
      //     //           builder: (context, state) => MultiBlocProvider(
      //     //             providers: [
      //     //               BlocProvider(
      //     //                 create: (context) => serviceLocator<SliderCubit>(),
      //     //               ),
      //     //               BlocProvider(
      //     //                 create: (context) => serviceLocator<ThumbnailsCubit>(),
      //     //               ),
      //     //             ],
      //     //             child: const PagePreview(),
      //     //           ),),
      //     //     ]
      //     // ),
      //
      //   ],
      // ),
    ],
  );
}
