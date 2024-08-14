abstract class DataState<T> {
  final T? data;
  final String? errorMessage;

  DataState({required this.data, required this.errorMessage});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required super.data}) : super(errorMessage: null);
}

class DataFailure<T> extends DataState<T> {
  DataFailure({required super.errorMessage}) : super(data: null);
}
