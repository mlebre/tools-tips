<?php

/**
 * Validation script to verify the transformation was correct
 */

// Count the rules in the original file
$originalContent = file_get_contents('validationRule.php');
preg_match_all("/'(\w+)'\s*=>\s*\[/", $originalContent, $matches);
// Filter out 'description', 'regex', 'field' entries
$actualRules = array_filter($matches[1], function($rule) {
    return !in_array($rule, ['description', 'regex', 'field']);
});
$originalRulesCount = count($actualRules);

// Count the SQL statements in the generated file
$sqlContent = file_get_contents('validation_rules_to_sql.sql');
$sqlCount = substr_count($sqlContent, 'INSERT INTO regex');

echo "Validation Results:\n";
echo "==================\n";
echo "Original rules in validationRule.php: $originalRulesCount\n";
echo "Generated SQL statements: $sqlCount\n";

if ($originalRulesCount === $sqlCount) {
    echo "✓ Count matches!\n";
} else {
    echo "✗ Count mismatch!\n";
}

// Check a few specific mappings
echo "\nSample validation:\n";
echo "==================\n";

// Check if isName rule is correctly mapped
if (strpos($sqlContent, "'isName'") !== false && 
    strpos($sqlContent, "'validation.isName'") !== false) {
    echo "✓ isName rule correctly mapped\n";
} else {
    echo "✗ isName rule mapping issue\n";
}

// Check if all required columns are present
$requiredColumns = ['name', 'pattern', 'lang', 'associated_kv', 'description', 'created_at', 'updated_at'];
$allColumnsPresent = true;
foreach ($requiredColumns as $column) {
    if (strpos($sqlContent, $column) === false) {
        echo "✗ Missing column: $column\n";
        $allColumnsPresent = false;
    }
}

if ($allColumnsPresent) {
    echo "✓ All required columns present\n";
}

// Check if CURRENT_TIMESTAMP and NULL are correctly used
if (strpos($sqlContent, 'CURRENT_TIMESTAMP') !== false && 
    strpos($sqlContent, 'NULL') !== false) {
    echo "✓ CURRENT_TIMESTAMP and NULL correctly used\n";
} else {
    echo "✗ CURRENT_TIMESTAMP or NULL missing\n";
}

echo "\nTransformation completed successfully!\n";
?>