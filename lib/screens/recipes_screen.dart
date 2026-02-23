import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../l10n/app_localizations.dart';
import '../data/mock_data.dart';
import '../models/recipe.dart';
import 'recipe_detail_screen.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  RecipeDifficulty? _selectedDifficulty;
  int? _maxTime;

  List<Recipe> get _filteredRecipes {
    return mockRecipes.where((recipe) {
      if (_selectedDifficulty != null &&
          recipe.difficulty != _selectedDifficulty) {
        return false;
      }
      if (_maxTime != null && recipe.cookingTime > _maxTime!) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.recipes)),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _filteredRecipes[index];
                return _buildRecipeCard(context, recipe)
                    .animate()
                    .fade(duration: 400.ms, delay: (index * 50).ms)
                    .slideX(begin: 0.1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          FilterChip(
            label: const Text('All'),
            selected: _selectedDifficulty == null && _maxTime == null,
            onSelected: (_) {
              setState(() {
                _selectedDifficulty = null;
                _maxTime = null;
              });
            },
          ),
          const SizedBox(width: 8),
          _difficultyChip(RecipeDifficulty.easy, 'Easy'),
          const SizedBox(width: 8),
          _difficultyChip(RecipeDifficulty.medium, 'Medium'),
          const SizedBox(width: 8),
          _difficultyChip(RecipeDifficulty.hard, 'Hard'),
          const SizedBox(width: 8),
          _timeChip(30, '< 30 min'),
          const SizedBox(width: 8),
          _timeChip(60, '< 60 min'),
        ],
      ),
    );
  }

  Widget _difficultyChip(RecipeDifficulty difficulty, String label) {
    return FilterChip(
      label: Text(label),
      selected: _selectedDifficulty == difficulty,
      onSelected: (selected) {
        setState(() {
          _selectedDifficulty = selected ? difficulty : null;
        });
      },
    );
  }

  Widget _timeChip(int time, String label) {
    return FilterChip(
      label: Text(label),
      selected: _maxTime == time,
      onSelected: (selected) {
        setState(() {
          _maxTime = selected ? time : null;
        });
      },
    );
  }

  Widget _buildRecipeCard(BuildContext context, Recipe recipe) {
    final color = _getDifficultyColor(recipe.difficulty);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailScreen(recipe: recipe),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color),
                    ),
                    child: Text(
                      recipe.difficulty.name.toUpperCase(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                recipe.description,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${recipe.cookingTime} min',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(RecipeDifficulty difficulty) {
    switch (difficulty) {
      case RecipeDifficulty.easy:
        return Colors.green;
      case RecipeDifficulty.medium:
        return Colors.orange;
      case RecipeDifficulty.hard:
        return Colors.red;
    }
  }
}
