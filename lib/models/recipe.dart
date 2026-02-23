enum RecipeDifficulty { easy, medium, hard }

class Recipe {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final RecipeDifficulty difficulty;
  final int cookingTime; // in minutes

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.difficulty,
    required this.cookingTime,
  });
}
