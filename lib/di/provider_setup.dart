
import 'package:http/http.dart' as http;
import 'package:image_search_app/data/data_source/pixabay_api.dart';
import 'package:image_search_app/data/repository/photo_api_repo_impl.dart';
import 'package:image_search_app/domain/use_case/get_photos_use_case.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//1.provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

//2. 독립적 객체
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  )
];
//3. 2번에 의존성있는 객체
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
      update: (context,client,_) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepoImpl>(
    update: (context,api,_) => PhotoApiRepoImpl(api),
  ),
  ProxyProvider<PhotoApiRepoImpl, GetPhotosUseCase>(
    update: (context,repo,_) => GetPhotosUseCase(repo),
  ),
];

//4.viewModels
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(context.read<GetPhotosUseCase>()),
  )
];