// part of 'home_bloc.dart';

// @immutable
import 'package:grocery_bloc_app/model/product_data_model.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToNotificationPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
