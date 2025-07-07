<?php

/**
 * Script to convert SQL INSERT statements to YAML fixtures format
 * for Regex and RegexField entities
 */

function parseRegexInserts($sqlContent) {
    $regexData = [];
    $regexFieldData = [];
    
    // Split the SQL content into lines
    $lines = explode("\n", $sqlContent);
    
    $currentRegexId = 1;
    $i = 0;
    
    while ($i < count($lines)) {
        $line = trim($lines[$i]);
        
        // Look for regex INSERT statements with values on the next line
        if (preg_match("/INSERT INTO regex \(name, pattern, lang, associated_kv, description, created_at, updated_at\) VALUES/", $line)) {
            $i++;
            $valueLine = trim($lines[$i]);
            
            // Parse the values line with more flexible regex to handle special characters
            if (preg_match("/^\s*\('([^']+)', '(.+)', (\d+), '([^']*)', '([^']*)', CURRENT_TIMESTAMP, NULL\);$/", $valueLine, $matches)) {
                $regexData[] = [
                    'id' => $currentRegexId,
                    'name' => $matches[1],
                    'pattern' => $matches[2],
                    'lang' => (int)$matches[3],
                    'associated_kv' => $matches[4],
                    'description' => $matches[5],
                    'created_at' => '2024-01-01 00:00:00',
                    'updated_at' => null
                ];
                $currentRegexId++;
            }
        }
        
        // Look for regex field INSERT statements (can be on same line or next line)
        if (preg_match("/INSERT INTO regex_field \(regex_id, field\) VALUES(.*)$/", $line, $matches)) {
            $valuePart = trim($matches[1]);
            
            // If values are on the same line
            if (!empty($valuePart)) {
                if (preg_match_all("/\(@regexId, '([^']+)'\)/", $valuePart, $fieldMatches, PREG_SET_ORDER)) {
                    $lastRegexId = count($regexData);
                    
                    foreach ($fieldMatches as $match) {
                        $regexFieldData[] = [
                            'regex_id' => $lastRegexId,
                            'field' => $match[1]
                        ];
                    }
                }
            } else {
                // Values are on the next line
                $i++;
                $valueLine = trim($lines[$i]);
                
                // Handle multiple field values on one line
                if (preg_match_all("/\(@regexId, '([^']+)'\)/", $valueLine, $fieldMatches, PREG_SET_ORDER)) {
                    $lastRegexId = count($regexData);
                    
                    foreach ($fieldMatches as $match) {
                        $regexFieldData[] = [
                            'regex_id' => $lastRegexId,
                            'field' => $match[1]
                        ];
                    }
                }
            }
        }
        
        $i++;
    }
    
    return [$regexData, $regexFieldData];
}

function generateYamlFixtures($regexData, $regexFieldData) {
    $yaml = "# Regex and RegexField Fixtures\n";
    $yaml .= "# Generated from sqlToFixtures.sql\n";
    $yaml .= "# French language entries have lang=1, Dutch language entries have lang=3\n\n";
    
    // Group by language for better organization
    $frenchRegex = [];
    $dutchRegex = [];
    
    foreach ($regexData as $regex) {
        if ($regex['lang'] == 1) {
            $frenchRegex[] = $regex;
        } else if ($regex['lang'] == 3) {
            $dutchRegex[] = $regex;
        }
    }
    
    // Generate French Regex fixtures
    $yaml .= "# French Language Regex Patterns (lang=1)\n";
    foreach ($frenchRegex as $index => $regex) {
        $yaml .= "regex_french_" . ($index + 1) . ":\n";
        $yaml .= "  name: '" . str_replace("'", "''", $regex['name']) . "'\n";
        $yaml .= "  pattern: '" . str_replace("'", "''", $regex['pattern']) . "'\n";
        $yaml .= "  lang: " . $regex['lang'] . "\n";
        $yaml .= "  associated_kv: '" . str_replace("'", "''", $regex['associated_kv']) . "'\n";
        $yaml .= "  description: '" . str_replace("'", "''", $regex['description']) . "'\n";
        $yaml .= "  created_at: '" . $regex['created_at'] . "'\n";
        $yaml .= "  updated_at: " . ($regex['updated_at'] ? "'" . $regex['updated_at'] . "'" : 'null') . "\n";
        $yaml .= "\n";
    }
    
    // Generate Dutch Regex fixtures
    $yaml .= "# Dutch Language Regex Patterns (lang=3)\n";
    foreach ($dutchRegex as $index => $regex) {
        $yaml .= "regex_dutch_" . ($index + 1) . ":\n";
        $yaml .= "  name: '" . str_replace("'", "''", $regex['name']) . "'\n";
        $yaml .= "  pattern: '" . str_replace("'", "''", $regex['pattern']) . "'\n";
        $yaml .= "  lang: " . $regex['lang'] . "\n";
        $yaml .= "  associated_kv: '" . str_replace("'", "''", $regex['associated_kv']) . "'\n";
        $yaml .= "  description: '" . str_replace("'", "''", $regex['description']) . "'\n";
        $yaml .= "  created_at: '" . $regex['created_at'] . "'\n";
        $yaml .= "  updated_at: " . ($regex['updated_at'] ? "'" . $regex['updated_at'] . "'" : 'null') . "\n";
        $yaml .= "\n";
    }
    
    // Generate RegexField fixtures
    $yaml .= "# RegexField entities (field mappings)\n";
    $fieldIndex = 1;
    foreach ($regexFieldData as $field) {
        $yaml .= "regex_field_" . $fieldIndex . ":\n";
        $yaml .= "  regex_id: " . $field['regex_id'] . "  # References regex entry #" . $field['regex_id'] . "\n";
        $yaml .= "  field: '" . str_replace("'", "''", $field['field']) . "'\n";
        $yaml .= "\n";
        $fieldIndex++;
    }
    
    return $yaml;
}

// Main execution
$sqlFile = __DIR__ . '/sqlToFixtures.sql';
$outputFile = __DIR__ . '/fixtures.yaml';

if (!file_exists($sqlFile)) {
    echo "Error: sqlToFixtures.sql not found!\n";
    exit(1);
}

$sqlContent = file_get_contents($sqlFile);
list($regexData, $regexFieldData) = parseRegexInserts($sqlContent);

echo "Parsed " . count($regexData) . " regex entries\n";
echo "Parsed " . count($regexFieldData) . " regex field entries\n";

$yaml = generateYamlFixtures($regexData, $regexFieldData);
file_put_contents($outputFile, $yaml);

echo "YAML fixtures generated successfully: " . $outputFile . "\n";