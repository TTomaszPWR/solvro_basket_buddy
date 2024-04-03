part of 'product_category_bloc.dart';

sealed class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

final class FetchProductCategories extends ProductCategoryEvent {
  final TokenModel token;

  const FetchProductCategories(this.token);

  @override
  List<Object> get props => [token];
}


