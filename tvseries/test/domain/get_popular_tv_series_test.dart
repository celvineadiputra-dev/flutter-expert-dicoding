import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/entities/tv_series.dart';
import 'package:tvseries/domain/usecases/get_popular_tv_series.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late GetPopularTvSeries useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetPopularTvSeries(mockTvSeriesRepository);
  });

  final tTvSeries = <TvSeries>[];

  group("Get Popular Tv Series", () {
    group("execute", () {
      test(
          "Should get list of movies form the repository when execute function is called",
              () async {
            when(mockTvSeriesRepository.getPopularTvSeries())
                .thenAnswer((_) async => Right(tTvSeries));

            final result = await useCase.execute();

            expect(result, Right(tTvSeries));
          });
    });
  });
}
