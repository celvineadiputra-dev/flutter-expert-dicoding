// import 'package:dartz/dartz.dart';
// import 'package:core/domain/usecases/save_tv_series_watchlist.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../dummy_data/dummy_objects.dart';
// import '../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late SaveTvSeriesWatchList useCase;
//   late MockTvSeriesRepository mockTvSeriesRepository;
//
//   setUp(() {
//     mockTvSeriesRepository = MockTvSeriesRepository();
//     useCase = SaveTvSeriesWatchList(mockTvSeriesRepository);
//   });
//
//   test('Should save tv series to the repository', () async {
//     when(mockTvSeriesRepository.saveWatchList(testTvSeriesDetail))
//         .thenAnswer((_) async => Right("Added to Watchlist"));
//
//     final result = await useCase.execute(testTvSeriesDetail);
//
//     verify(mockTvSeriesRepository.saveWatchList(testTvSeriesDetail));
//
//     expect(result, Right('Added to Watchlist'));
//   });
// }
