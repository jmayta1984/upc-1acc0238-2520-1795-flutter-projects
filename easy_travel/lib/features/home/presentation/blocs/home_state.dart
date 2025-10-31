import 'package:easy_travel/features/home/domain/category.dart';
import 'package:easy_travel/features/home/domain/destination.dart';

//enum Status { initial, loading, success, failure} 

class HomeState {
  final bool isLoading;
  final CategoryType selectedCategory;
  final List<Destination> destinations;
  final String message;
  //final Status status;

  const HomeState({
    this.isLoading = false,
    this.selectedCategory = CategoryType.all,
    this.destinations = const [],
    this.message = '',
    //this.status = Status.initial
  });

  HomeState copytWith ({
    bool? isLoading,
    CategoryType? selectedCategory,
    List<Destination>? destinations,
    String? message,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      destinations: destinations ?? this.destinations,
      message: message ?? this.message
    );
  }
}