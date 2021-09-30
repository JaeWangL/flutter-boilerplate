enum Status { LOADING, SUCCESS, ERROR }

class ApiResource<T> {
  final T? data;
  final Status status;
  final String? message;

  ApiResource(
    this.status,
    this.data,
    this.message,
  );
}
