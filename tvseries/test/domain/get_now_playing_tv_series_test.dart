import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:tvseries/domain/usecases/get_now_playing_tv_series.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late GetNowPlayingTvSeries useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetNowPlayingTvSeries(mockTvSeriesRepository);
  });

  final tTvSeries = <TvSeries>[];

  test('shoud get list of tv series from the repository', () async {
    when(mockTvSeriesRepository.getNowPlayingTvSeries())
        .thenAnswer((realInvocation) async => Right(tTvSeries));

    final result = await useCase.execute();

    expect(result, Right(tTvSeries));
  });
}
