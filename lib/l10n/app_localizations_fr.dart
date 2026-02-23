// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'NoGlutin';

  @override
  String get home => 'Accueil';

  @override
  String get recipes => 'Recettes';

  @override
  String get stores => 'Magasins';

  @override
  String get glutenFreeRecipes => 'Recettes sans Gluten';

  @override
  String get groceryStores => 'Épiceries';

  @override
  String get viewDetails => 'Voir les détails';

  @override
  String get ingredients => 'Ingrédients';

  @override
  String get instructions => 'Instructions';

  @override
  String get location => 'Emplacement';

  @override
  String get contact => 'Contact';

  @override
  String get search => 'Rechercher...';

  @override
  String get noResults => 'Aucun résultat trouvé';

  @override
  String get aboutUs => 'À propos';

  @override
  String get dedication =>
      'Cette application est réalisée par Hazem Abdelouakil';
}
