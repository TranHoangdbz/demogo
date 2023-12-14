import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final bool? success;
  final String? error;

  ProductState({
    ProductState? state,
    bool? success,
    String? error,
  })  : success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error];
}
