# YAML Fixtures for Regex Entities

This directory contains YAML fixture files that correspond to the SQL data in `regexSqlToYaml.sql`.

## Files

- `regex_fixtures.yaml` - Contains all regex pattern fixtures for French (lang=1) and Dutch (lang=3)
- `lang_fixtures.yaml` - Contains the language entity references needed by the regex fixtures

## Usage

These fixtures are designed to work with Doctrine fixture loading (e.g., using Hautelook Alice Bundle).

The fixtures convert the SQL INSERT statements from `regexSqlToYaml.sql` into YAML format while maintaining:
- All regex names, patterns, and descriptions
- Language associations (French = 1, Dutch = 3)
- Proper entity relationships

## Entity Mapping

The YAML fixtures map to the `Obiz\MegaBundle\Entity\Regex` entity with these fields:
- `name` - The regex identifier (e.g., 'isName', 'isEmail')
- `pattern` - The actual regex pattern 
- `description` - Human-readable description of the validation rule
- `lang` - Reference to the Lang entity (using @lang_fr or @lang_nl references)

## Language References

The fixtures use entity references `@lang_fr` and `@lang_nl` which correspond to:
- `@lang_fr` -> Lang entity with lang_id = 1 (French)
- `@lang_nl` -> Lang entity with lang_id = 3 (Dutch/Nederlands)

Make sure the Lang entities exist in your fixtures or database before loading the regex fixtures.

## Loading Fixtures

If using Hautelook Alice Bundle, you can load these fixtures with:
```bash
php bin/console hautelook:fixtures:load
```

## Original SQL Reference

These fixtures are a direct conversion from the SQL INSERT statements in `regexSqlToYaml.sql`, preserving all the validation patterns and descriptions for both French and Dutch language variants.