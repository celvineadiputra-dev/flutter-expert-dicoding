import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tvseries/domain/usecases/get_tv_series_watch_list_status.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late GetTvSeriesWatchListStatus useCase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    useCase = GetTvSeriesWatchListStatus(mockTvSeriesRepository);
  });

  const tId = 1;

  test('should get watchlist status from repository', () async {
    when(mockTvSeriesRepository.isAddedToWatchList(tId)).thenAnswer((_) async => true);

    final result = await useCase.execute(tId);

    expect(result, true);
  });
}