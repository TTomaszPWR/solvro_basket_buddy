part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class FetchProducts extends ProductEvent {
  final TokenModel token;

  const FetchProducts(this.token);

  @override
  List<Object> get props => [token];
}
