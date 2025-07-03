<?php

// Include the regex.php file to get the $defaultRules array
include 'regex.php';

/**
 * Convert PHP regex array to SQL INSERT statements
 * 
 * Table structure:
 * CREATE TABLE regex (
 *   id INT AUTO_INCREMENT NOT NULL,
 *   lang INT NOT NULL,
 *   name VARCHAR(100) NOT NULL,
 *   pattern VARCHAR(200) NOT NULL,
 *   description VARCHAR(500) DEFAULT NULL,
 *   created_at DATETIME DEFAULT NULL,
 *   updated_at DATETIME DEFAULT NULL,
 *   INDEX IDX_4204F8CA31098462 (lang),
 *   PRIMARY KEY(id)
 * ) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
 */

// Configuration
$langId = 1; // Default language ID (assuming 1 for English or default)
$currentTimestamp = date('Y-m-d H:i:s');

// Function to escape SQL strings
function escapeSqlString($string) {
    // Use proper SQL escaping - replace single quotes with double single quotes
    return str_replace("'", "''", $string);
}

// Function to generate SQL INSERT statement
function generateInsertStatement($name, $pattern, $description, $langId, $timestamp) {
    $escapedName = escapeSqlString($name);
    $escapedPattern = escapeSqlString($pattern);
    $escapedDescription = escapeSqlString($description);
    
    return "INSERT INTO regex (lang, name, pattern, description, created_at, updated_at) VALUES " .
           "($langId, '$escapedName', '$escapedPattern', '$escapedDescription', '$timestamp', '$timestamp');";
}

// Start output
echo "-- SQL INSERT statements generated from regex.php\n";
echo "-- Generated on: " . date('Y-m-d H:i:s') . "\n\n";

// Process each regex rule
foreach ($defaultRules as $ruleName => $ruleData) {
    $description = isset($ruleData['description']) ? $ruleData['description'] : '';
    $regex = $ruleData['regex'];
    
    // Handle cases where regex is an array (like isPassword)
    if (is_array($regex)) {
        // For array of regex patterns, we'll create separate entries for each pattern
        for ($i = 0; $i < count($regex); $i++) {
            $patternName = $ruleName . '_' . ($i + 1);
            $pattern = $regex[$i];
            echo generateInsertStatement($patternName, $pattern, $description, $langId, $currentTimestamp) . "\n";
        }
    } else {
        // Single regex pattern
        echo generateInsertStatement($ruleName, $regex, $description, $langId, $currentTimestamp) . "\n";
    }
}

echo "\n-- End of SQL INSERT statements\n";
?>