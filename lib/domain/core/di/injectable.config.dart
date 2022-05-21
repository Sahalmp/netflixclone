// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i10;
import '../../../application/fastlaugh/fastlaugh_bloc.dart' as _i11;
import '../../../application/home/home_bloc.dart' as _i12;
import '../../../application/newandhot/bloc/hotandnew_bloc.dart' as _i5;
import '../../../application/Search/search_bloc.dart' as _i13;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i7;
import '../../../infrastructure/hot_and_new/hot_and_new_impl.dart' as _i4;
import '../../../infrastructure/search/search_implementation.dart' as _i9;
import '../../downloads/i_downloads_repo.dart' as _i6;
import '../../NewandHot/hotandnew_service.dart' as _i3;
import '../../search/searchservice.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplementaion());
  gh.factory<_i5.HotandnewBloc>(
      () => _i5.HotandnewBloc(get<_i3.HotAndNewService>()));
  gh.lazySingleton<_i6.IDownloadsRepo>(() => _i7.DownloadsRepository());
  gh.lazySingleton<_i8.SearchService>(() => _i9.SearchImpl());
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i6.IDownloadsRepo>()));
  gh.factory<_i11.FastlaughBloc>(
      () => _i11.FastlaughBloc(get<_i6.IDownloadsRepo>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i13.SearchBloc>(() =>
      _i13.SearchBloc(get<_i8.SearchService>(), get<_i6.IDownloadsRepo>()));
  return get;
}
