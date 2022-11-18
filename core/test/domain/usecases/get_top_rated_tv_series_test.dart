// import 'package:dartz/dartz.dart';
// import 'package:core/domain/entities/tv_series.dart';
// import 'package:core/domain/usecases/get_top_rated_tv_series.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// import '../../helpers/test_helper.mocks.dart';
//
// void main() {
//   late GetTopRatedTvSeries useCase;
//   late MockTvSeriesRepository mockTvSeriesRepository;
//
//
//   setUp(() {
//     mockTvSeriesRepository = MockTvSeriesRepository();
//     useCase = GetTopRatedTvSeries(mockTvSeriesRepository);
//   });
//
//   final tTvSeries = <TvSeries>[];
//
//
//   test('Should get list of tv series from repository', () async {
//     when(mockTvSeriesRepository.getTopRatedTvSeries()).thenAnswer((_) async => Right(tTvSeries));
//
//     final result = await useCase.execute();
//
//     expect(result, Right(tTvSeries));
//   });
// }