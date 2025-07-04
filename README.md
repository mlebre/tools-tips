# Validation Rules to SQL Transformation

This directory contains the transformation of PHP validation rules to SQL INSERT statements.

## Files:

1. **validationRule.php** - Original PHP file containing validation rules
2. **validation_rules_to_sql.sql** - Generated SQL INSERT statements
3. **transform_validation_rules_manual.php** - Script used to generate the SQL
4. **validate_transformation.php** - Validation script to verify the transformation

## Transformation Mapping:

- Array key → `name` column
- Translation function argument → `associated_kv` column
- Regex pattern → `pattern` column  
- Static values:
  - `lang` = 1
  - `description` = NULL
  - `created_at` = CURRENT_TIMESTAMP
  - `updated_at` = NULL

## Results:

- ✅ 20 validation rules successfully transformed
- ✅ All required columns mapped correctly
- ✅ SQL syntax validated
- ✅ Translation keys extracted properly

## Usage:

Run the generated SQL file against your database to insert the validation rules:

```sql
-- Execute validation_rules_to_sql.sql
```

The SQL statements follow the table structure:

```sql
CREATE TABLE regex (
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    pattern VARCHAR(200) NOT NULL,
    lang INT NOT NULL,
    associated_kv VARCHAR(100) DEFAULT NULL,
    description VARCHAR(500) DEFAULT NULL,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    INDEX IDX_4204F8CA31098462 (lang),
    PRIMARY KEY(id)
) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB;
```