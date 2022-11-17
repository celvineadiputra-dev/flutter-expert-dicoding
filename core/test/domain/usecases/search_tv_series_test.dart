// import 'package:dartz/dartz.dart';
// import 'package:core/domain/entities/tv_series.dart';
// import 'package:core/domain/usecases/search_tv_series.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late SearchTvSeries useCase;
//   late MockTvSeriesRepository mockTvSeriesRepository;
//
//   setUp(() {
//     mockTvSeriesRepository = MockTvSeriesRepository();
//     useCase = SearchTvSeries(mockTvSeriesRepository);
//   });
//
//   final tTvSeries = <TvSeries>[];
//   final tQuery = 'test';
//
//   test("Should get list of tv series from the repository", () async {
//     when(mockTvSeriesRepository.searchTvSeries(tQuery))
//         .thenAnswer((_) async => Right(tTvSeries));
//
//     final result = await useCase.execute(tQuery);
//
//     expect(result, Right(tTvSeries));
//   });
// }
