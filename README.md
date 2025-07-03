# Regex to SQL Conversion

This directory contains a script to convert PHP regex patterns to SQL INSERT statements.

## Files

- `regex.php` - Contains the original PHP array of regex patterns
- `regex_to_sql.php` - Conversion script that generates SQL INSERT statements
- `regex_inserts.sql` - Generated SQL file with INSERT statements
- `test_conversion.php` - Test script to verify the conversion

## Usage

### Generate SQL INSERT statements

```bash
php regex_to_sql.php > regex_inserts.sql
```

### Run the conversion test

```bash
php test_conversion.php
```

## SQL Table Structure

The generated INSERT statements are designed for the following table structure:

```sql
CREATE TABLE regex (
    id INT AUTO_INCREMENT NOT NULL,
    lang INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    pattern VARCHAR(200) NOT NULL,
    description VARCHAR(500) DEFAULT NULL,
    created_at DATETIME DEFAULT NULL,
    updated_at DATETIME DEFAULT NULL,
    INDEX IDX_4204F8CA31098462 (lang),
    PRIMARY KEY(id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
```

## Conversion Details

- **Array keys** become the `name` field in the database
- **Regex patterns** become the `pattern` field  
- **Descriptions** are preserved in the `description` field
- **Language ID** is set to `1` (configurable in the script)
- **Timestamps** are set to current time for both `created_at` and `updated_at`
- **Multiple patterns** (like isPassword) are split into separate entries with suffixes (_1, _2, _3, etc.)

## Features

- ✅ Handles single regex patterns
- ✅ Handles arrays of regex patterns (like isPassword)
- ✅ Proper SQL escaping for special characters
- ✅ Automatic timestamp generation
- ✅ Configurable language ID
- ✅ Comprehensive testing

## Output

The script generates 20 INSERT statements from 18 original regex rules (isPassword expands to 3 separate entries).