# SQL to YAML Fixtures Conversion

This directory contains the conversion of SQL INSERT statements to YAML fixtures format for the Regex and RegexField entities.

## Generated Files

### Core Files
- **`fixtures.yaml`** - Main YAML fixtures file containing all regex patterns and field mappings
- **`sql_to_yaml_converter.php`** - Script that converts SQL INSERT statements to YAML format
- **`validate_yaml.php`** - Validation script to verify the conversion accuracy

### Source Data
- **`sqlToFixtures.sql`** - Original SQL file with INSERT statements for both entities
- **`Regex.php`** - PHP entity definition for Regex table
- **`RegexField.php`** - PHP entity definition for RegexField table

## YAML Structure

The generated `fixtures.yaml` file contains:

### Regex Entities
Organized by language:
- **French patterns** (`lang: 1`): 21 validation rules
- **Dutch patterns** (`lang: 3`): 21 validation rules

Each regex entry contains:
```yaml
regex_french_X:
  name: 'validation_rule_name'
  pattern: '/regex_pattern/'
  lang: 1 (French) or 3 (Dutch)
  associated_kv: 'translation_key'
  description: 'Human readable description'
  created_at: '2024-01-01 00:00:00'
  updated_at: null
```

### RegexField Entities
Field mappings that associate form fields with validation rules:
```yaml
regex_field_X:
  regex_id: Y  # References regex entry #Y
  field: 'field_name'
```

## Validation Rules Included

The fixtures include common validation patterns for:
- **Names**: `isName` - Validates first names and last names
- **Contact Info**: `isEmail`, `isPhone` - Email addresses and phone numbers
- **Location**: `isCity`, `isCountry`, `isAddress` - Geographic information
- **Credentials**: `isPassword`, `isPseudo` - User authentication
- **Data Types**: `isInteger`, `isDate`, `isCard` - Various data formats
- **Messages**: `isMessage`, `isKeyword` - User-generated content
- **IDs**: `isOauthId`, `isUuid`, `isOtherid` - Various identifier formats
- **Settings**: `isOptin`, `isCivility` - User preferences and demographics

## Usage

To use these fixtures in your testing or seeding:

1. Load the YAML file into your fixture loader
2. The fixtures reference both Regex and RegexField entities
3. French patterns have `lang: 1`, Dutch patterns have `lang: 3`
4. RegexField entries reference their parent Regex via `regex_id`

## Validation

Run the validation script to verify the fixtures:
```bash
php validate_yaml.php
```

This will check:
- ✅ File integrity
- ✅ Entry counts
- ✅ Language distribution
- ✅ Pattern validation
- ✅ Field mapping verification
- ✅ YAML syntax

## Statistics

- **Total Regex entries**: 42 (21 French + 21 Dutch)
- **Total RegexField entries**: 42
- **Validation patterns**: 21 unique validation rules per language
- **Field mappings**: Complete mapping for all form fields