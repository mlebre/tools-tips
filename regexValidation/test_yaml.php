<?php

/**
 * Simple test to verify YAML fixtures can be loaded and used
 */

// Check if yaml extension is available
if (!extension_loaded('yaml')) {
    echo "⚠️  YAML extension not available, using basic parsing test\n";
    
    // Basic YAML structure test
    $yamlContent = file_get_contents(__DIR__ . '/fixtures.yaml');
    
    // Test that it contains expected sections
    $tests = [
        'French regex entries' => preg_match('/^regex_french_\d+:$/m', $yamlContent),
        'Dutch regex entries' => preg_match('/^regex_dutch_\d+:$/m', $yamlContent),
        'RegexField entries' => preg_match('/^regex_field_\d+:$/m', $yamlContent),
        'Language codes' => strpos($yamlContent, 'lang: 1') !== false && strpos($yamlContent, 'lang: 3') !== false,
        'Pattern formats' => strpos($yamlContent, "pattern: '/^") !== false,
        'Field mappings' => strpos($yamlContent, "field: '") !== false,
    ];
    
    echo "Basic YAML Structure Tests:\n";
    foreach ($tests as $name => $result) {
        echo ($result ? "✅" : "❌") . " $name\n";
    }
    
} else {
    echo "✅ YAML extension available, running full parsing test\n";
    
    // Full YAML parsing test
    $yamlContent = file_get_contents(__DIR__ . '/fixtures.yaml');
    $data = yaml_parse($yamlContent);
    
    if ($data === false) {
        echo "❌ Failed to parse YAML\n";
        exit(1);
    }
    
    echo "✅ YAML parsed successfully\n";
    
    // Count entries
    $regexCount = 0;
    $fieldCount = 0;
    $frenchCount = 0;
    $dutchCount = 0;
    
    foreach ($data as $key => $entry) {
        if (strpos($key, 'regex_french_') === 0) {
            $regexCount++;
            $frenchCount++;
        } elseif (strpos($key, 'regex_dutch_') === 0) {
            $regexCount++;
            $dutchCount++;
        } elseif (strpos($key, 'regex_field_') === 0) {
            $fieldCount++;
        }
    }
    
    echo "📊 Parsed Entry Counts:\n";
    echo "   - Total regex entries: $regexCount\n";
    echo "   - French entries: $frenchCount\n";
    echo "   - Dutch entries: $dutchCount\n";
    echo "   - Field entries: $fieldCount\n";
    
    // Test specific entries
    if (isset($data['regex_french_1'])) {
        $entry = $data['regex_french_1'];
        echo "🧪 Sample French entry test:\n";
        echo "   - Name: " . ($entry['name'] ?? 'MISSING') . "\n";
        echo "   - Lang: " . ($entry['lang'] ?? 'MISSING') . "\n";
        echo "   - Pattern: " . substr($entry['pattern'] ?? 'MISSING', 0, 50) . "...\n";
    }
    
    if (isset($data['regex_dutch_1'])) {
        $entry = $data['regex_dutch_1'];
        echo "🧪 Sample Dutch entry test:\n";
        echo "   - Name: " . ($entry['name'] ?? 'MISSING') . "\n";
        echo "   - Lang: " . ($entry['lang'] ?? 'MISSING') . "\n";
        echo "   - Pattern: " . substr($entry['pattern'] ?? 'MISSING', 0, 50) . "...\n";
    }
    
    if (isset($data['regex_field_1'])) {
        $entry = $data['regex_field_1'];
        echo "🧪 Sample field entry test:\n";
        echo "   - Regex ID: " . ($entry['regex_id'] ?? 'MISSING') . "\n";
        echo "   - Field: " . ($entry['field'] ?? 'MISSING') . "\n";
    }
}

echo "\n🎉 YAML fixtures test completed!\n";