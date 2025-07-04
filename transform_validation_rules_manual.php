<?php

/**
 * Script to transform validationRule.php array into SQL INSERT statements
 * for the regex table according to the specified mapping requirements.
 */

// Function to escape SQL strings
function escapeSqlString($str) {
    return "'" . str_replace("'", "''", $str) . "'";
}

// Read the entire file
$content = file_get_contents('validationRule.php');

// Define the rules manually by extracting each one from the file
$validationRules = [
    'isName' => [
        'translation_key' => 'validation.isName',
        'regex' => '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/'
    ],
    'isCity' => [
        'translation_key' => 'validation.isCity',
        'regex' => '/^.{2,300}$/'
    ],
    'isAddress' => [
        'translation_key' => 'validation.isAddress',
        'regex' => '/^.{2,300}$/'
    ],
    'isEstablishment' => [
        'translation_key' => 'validation.isEstablishment',
        'regex' => '/^[a-zA-Z0-9- \'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ<>%&]{2,300}$/'
    ],
    'isInteger' => [
        'translation_key' => 'validation.isInteger',
        'regex' => '/^[0-9]+$/'
    ],
    'isPhone' => [
        'translation_key' => 'validation.isPhone',
        'regex' => '/^(\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14})?$/'
    ],
    'isZipcode' => [
        'translation_key' => 'validation.isZipcode',
        'regex' => '/^[0-9]{5}$/'
    ],
    'isEmail' => [
        'translation_key' => 'validation.isEmail',
        'regex' => '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/'
    ],
    'isKeyword' => [
        'translation_key' => 'validation.isKeyword',
        'regex' => '/^[[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u'
    ],
    'isLocation' => [
        'translation_key' => 'validation.isLocation',
        'regex' => '/^[[a-zA-Z0-9 ,\._\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ-]{2,150}$/u'
    ],
    'isPseudo' => [
        'translation_key' => 'validation.isPseudo',
        'regex' => '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u'
    ],
    'isCivility' => [
        'translation_key' => 'validation.isCivility',
        'regex' => '/^[1-2]$/'
    ],
    'isPassword' => [
        'translation_key' => 'validation.password',
        'regex' => '/^[a-zA-Z[0-9\.\/\)\(€§\-_!,;:=+\'"#&@ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{8,16}$/'
    ],
    'isDate' => [
        'translation_key' => 'validation.isDate',
        'regex' => '/^(((19)(\d{2})|(20)([01])(\d{1}))-(0?[1-9]|1?[012])-(([012])([0-9])|(3[01])))|((([012])([0-9])|(3[01]))-(0?[1-9]|1?[012])-((19)(\d{2})|(20)([01])(\d{1})))$/'
    ],
    'isCard' => [
        'translation_key' => 'validation.isCard',
        'regex' => '/^([0-9a-zA-Z]{8}|[0-9a-zA-Z]{13})$/'
    ],
    'isOauthId' => [
        'translation_key' => 'validation.isOauthId',
        'regex' => '/^[0-9a-zA-Z]{8,45}$/'
    ],
    'isOptin' => [
        'translation_key' => 'validation.isOptin',
        'regex' => '/^[0-1]{1}$/i'
    ],
    'isMessage' => [
        'translation_key' => 'validation.isMessage',
        'regex' => '/^.{30,400}$/m'
    ],
    'isUuid' => [
        'translation_key' => 'validation.isUuid',
        'regex' => '/^[a-zA-Z-0-9]{1,400}$/'
    ],
    'isOtherid' => [
        'translation_key' => 'validation.isOtherid',
        'regex' => '/^[0-9a-zA-Z\-_ ]{4,256}$/'
    ]
];

// Generate SQL INSERT statements
$sqlStatements = [];
$sqlStatements[] = "-- Generated SQL INSERT statements for regex table from validationRule.php";
$sqlStatements[] = "-- Mapping: key->name, trans_arg->associated_kv, regex->pattern, lang=1, description=NULL";
$sqlStatements[] = "";

foreach ($validationRules as $key => $rule) {
    $name = $key;
    $associatedKv = $rule['translation_key'];
    $pattern = $rule['regex'];
    
    // Build the SQL INSERT statement
    $sql = "INSERT INTO regex (name, pattern, lang, associated_kv, description, created_at, updated_at) VALUES (";
    $sql .= escapeSqlString($name) . ", ";
    $sql .= escapeSqlString($pattern) . ", ";
    $sql .= "1, ";
    $sql .= ($associatedKv ? escapeSqlString($associatedKv) : "NULL") . ", ";
    $sql .= "NULL, ";
    $sql .= "CURRENT_TIMESTAMP, ";
    $sql .= "NULL";
    $sql .= ");";
    
    $sqlStatements[] = $sql;
}

// Write the SQL statements to a file
$outputFile = 'validation_rules_to_sql.sql';
file_put_contents($outputFile, implode("\n", $sqlStatements));

echo "SQL statements generated and saved to: $outputFile\n";
echo "Total rules processed: " . count($validationRules) . "\n";

// Display the first few statements for verification
echo "\nFirst 5 SQL statements:\n";
for ($i = 3; $i < min(8, count($sqlStatements)); $i++) {
    echo $sqlStatements[$i] . "\n";
}

// Display the last few statements for verification
echo "\nLast 3 SQL statements:\n";
for ($i = max(3, count($sqlStatements) - 3); $i < count($sqlStatements); $i++) {
    echo $sqlStatements[$i] . "\n";
}
?>