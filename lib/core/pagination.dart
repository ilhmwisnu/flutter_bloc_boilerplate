class Pagination<T> {
  final int page;
  final int limit;
  final int total;
  final int totalPage;
  final List<T> data;

  Pagination({
    required this.data,
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });
}
