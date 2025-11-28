abstract class MealsEvent {
  const MealsEvent();
}

class GetMealsByCategory extends MealsEvent {
  final String category;
  const GetMealsByCategory(this.category);
}
