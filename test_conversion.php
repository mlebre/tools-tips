<?php

// Test script to verify the conversion is correct
include 'regex.php';

echo "Testing the regex conversion...\n\n";

// Count original entries
$originalCount = count($defaultRules);
echo "Original regex rules count: $originalCount\n";

// Count entries with array patterns
$arrayPatternCount = 0;
$totalPatternsCount = 0;

foreach ($defaultRules as $ruleName => $ruleData) {
    if (is_array($ruleData['regex'])) {
        $arrayPatternCount++;
        $totalPatternsCount += count($ruleData['regex']);
        echo "Rule '$ruleName' has " . count($ruleData['regex']) . " patterns\n";
    } else {
        $totalPatternsCount++;
    }
}

echo "\nRules with array patterns: $arrayPatternCount\n";
echo "Total patterns (including array expansions): $totalPatternsCount\n";

// Verify against generated SQL
$sqlContent = file_get_contents('regex_inserts.sql');
$insertCount = substr_count($sqlContent, 'INSERT INTO regex');

echo "Generated SQL INSERT statements: $insertCount\n";

if ($insertCount == $totalPatternsCount) {
    echo "\n✓ SUCCESS: Number of INSERT statements matches total patterns!\n";
} else {
    echo "\n✗ ERROR: Mismatch between expected patterns and generated INSERT statements!\n";
}

// Test SQL escaping
echo "\nTesting SQL escaping...\n";
$testString = "Test with 'single quotes' and \"double quotes\"";
function escapeSqlString($string) {
    return str_replace("'", "''", $string);
}
$escaped = escapeSqlString($testString);
echo "Original: $testString\n";
echo "Escaped: $escaped\n";

echo "\nConversion test completed.\n";
?>