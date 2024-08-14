enum Status { initial, loading, success, failure }

abstract class BaseListState<T> {
  BaseListState(
      {this.errorMessage, this.data, this.status = Status.initial, this.page = 1, this.totalPage = 1});

  final Status status;
  final String? errorMessage;
  final List<T>? data;
  final int page;
  final int totalPage;

  bool get isLastPage => page == totalPage;
}

abstract class BaseState<T> {
  BaseState({this.errorMessage, this.data, this.status = Status.initial});

  final Status status;
  final String? errorMessage;
  final T? data;
}
