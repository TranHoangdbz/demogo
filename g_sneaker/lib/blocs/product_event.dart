import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

final class CatalogStarted extends ProductEvent {
  @override
  List<Object> get props => [];
}
