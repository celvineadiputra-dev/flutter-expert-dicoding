import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:tvseries/domain/usecases/get_tv_series_recommendations.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late GetTvSeriesRecommendation useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetTvSeriesRecommendation(mockTvSeriesRepository);
  });

  final tId = 1;
  final tTvSeries = <TvSeries>[];

  test("Should get list of tv series recommendations from the repository",
      () async {
    when(mockTvSeriesRepository.getRecommendation(tId))
        .thenAnswer((_) async => Right(tTvSeries));

    final result = await useCase.execute(tId);

    expect(result, Right(tTvSeries));
  });
}
