<?php

/**
 * Validation script to verify the generated YAML fixtures
 */

echo "Validating generated YAML fixtures...\n\n";

// Check if files exist
$yamlFile = __DIR__ . '/fixtures.yaml';
$sqlFile = __DIR__ . '/sqlToFixtures.sql';

if (!file_exists($yamlFile)) {
    echo "❌ fixtures.yaml not found!\n";
    exit(1);
}

if (!file_exists($sqlFile)) {
    echo "❌ sqlToFixtures.sql not found!\n";
    exit(1);
}

// Load and parse YAML content
$yamlContent = file_get_contents($yamlFile);
$sqlContent = file_get_contents($sqlFile);

echo "📁 Files found successfully\n";

// Count entries in YAML
$frenchRegexCount = preg_match_all('/^regex_french_\d+:$/m', $yamlContent);
$dutchRegexCount = preg_match_all('/^regex_dutch_\d+:$/m', $yamlContent);
$regexFieldCount = preg_match_all('/^regex_field_\d+:$/m', $yamlContent);

echo "📊 YAML Statistics:\n";
echo "   - French regex entries: $frenchRegexCount\n";
echo "   - Dutch regex entries: $dutchRegexCount\n";
echo "   - Total regex entries: " . ($frenchRegexCount + $dutchRegexCount) . "\n";
echo "   - RegexField entries: $regexFieldCount\n";

// Count entries in SQL
$sqlRegexCount = preg_match_all('/INSERT INTO regex.*VALUES/m', $sqlContent);
$sqlFieldCount = preg_match_all('/INSERT INTO regex_field.*VALUES/m', $sqlContent);

echo "📊 SQL Statistics:\n";
echo "   - Total regex INSERT statements: $sqlRegexCount\n";
echo "   - Total regex_field INSERT statements: $sqlFieldCount\n";

// Check for French and Dutch languages
$frenchCount = preg_match_all('/lang: 1/', $yamlContent);
$dutchCount = preg_match_all('/lang: 3/', $yamlContent);

echo "🌐 Language Distribution:\n";
echo "   - French (lang=1): $frenchCount entries\n";
echo "   - Dutch (lang=3): $dutchCount entries\n";

// Verify some specific patterns
$patterns = [
    'isName' => '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/',
    'isEmail' => '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/',
    'isPhone' => '/^(\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14})?$/'
];

echo "🔍 Pattern Verification:\n";
foreach ($patterns as $name => $pattern) {
    $escapedPattern = str_replace('/', '\/', $pattern);
    if (strpos($yamlContent, $pattern) !== false) {
        echo "   ✅ $name pattern found\n";
    } else {
        echo "   ❌ $name pattern NOT found\n";
    }
}

// Check for field mappings
$fields = ['lastname', 'firstname', 'email', 'phone', 'city', 'country', 'address'];
echo "🔗 Field Mapping Verification:\n";
foreach ($fields as $field) {
    if (strpos($yamlContent, "field: '$field'") !== false) {
        echo "   ✅ $field field found\n";
    } else {
        echo "   ❌ $field field NOT found\n";
    }
}

// Validate YAML syntax (basic check)
$lines = explode("\n", $yamlContent);
$syntaxErrors = 0;

foreach ($lines as $lineNum => $line) {
    if (trim($line) === '') continue;
    if (strpos($line, '#') === 0) continue;
    
    // Check for proper indentation
    if (preg_match('/^[a-zA-Z]/', $line) && !preg_match('/^[a-zA-Z_][a-zA-Z0-9_]*:/', $line)) {
        echo "   ⚠️  Line " . ($lineNum + 1) . " may have syntax issues: " . trim($line) . "\n";
        $syntaxErrors++;
    }
}

echo "\n📝 YAML Syntax Check:\n";
if ($syntaxErrors === 0) {
    echo "   ✅ No obvious syntax errors found\n";
} else {
    echo "   ⚠️  $syntaxErrors potential syntax issues found\n";
}

echo "\n🎉 Validation completed!\n";