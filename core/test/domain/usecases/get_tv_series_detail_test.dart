import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/get_tv_series_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesDetail useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetTvSeriesDetail(mockTvSeriesRepository);
  });

  final tId = 1;

  test('Should get tv series detail from the repository', () async {
    when(mockTvSeriesRepository.getDetailTvSeries(tId)).thenAnswer((_) async => Right(testTvSeriesDetail));

    final result = await useCase.execute(tId);

    expect(result, Right(testTvSeriesDetail));
  });
}