import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_watchlist_tv_series.dart';

import '../dummy_data/dummy_objects.dart';
import '../helper/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvSeries useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetWatchlistTvSeries(mockTvSeriesRepository);
  });

  final listData= [testTvSeries];
  test('Should get list of tv series from the repository', () async {
    when(mockTvSeriesRepository.getAllWatchList())
        .thenAnswer((_) async => Right(listData));

    final result = await useCase.execute();

    expect(result, Right(listData));
  });
}
