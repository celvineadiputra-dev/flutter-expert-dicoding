// import 'package:dartz/dartz.dart';
// import 'package:core/domain/usecases/remove_tv_series_watchlist.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../dummy_data/dummy_objects.dart';
// import '../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late RemoveTvSeriesWatchList useCase;
//   late MockTvSeriesRepository mockTvSeriesRepository;
//
//   setUp(() {
//     mockTvSeriesRepository = MockTvSeriesRepository();
//     useCase = RemoveTvSeriesWatchList(mockTvSeriesRepository);
//   });
//
//   test('should remove watchlist tv series from repository', () async {
//     when(mockTvSeriesRepository.removeWatchList(testTvSeriesDetail))
//         .thenAnswer((_) async => Right('Removed from watchlist'));
//
//     final result = await useCase.execute(testTvSeriesDetail);
//
//     verify(mockTvSeriesRepository.removeWatchList(testTvSeriesDetail));
//
//     expect(result, Right('Removed from watchlist'));
//   });
// }
