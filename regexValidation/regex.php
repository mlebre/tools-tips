<?php


$defaultRules = array(
            'isName' => array(
                'description' => 'Only letters (accentuated included), spaces and dashes. Between 2 and 300 characters.',
                'regex' => '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/',
                'field' => array('lastname', 'firstname'))
        ,
            'isCity' => array(
                'description' => 'Only letters (accentuated included) and dashes. Between 2 and 300 characters.',
                'regex' => '/^[a-zA-Z-ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/',
                'field' => array('city', 'country'))
        ,
            'isAddress' => array(
                'description' => 'Only characters (letters, accentuated letters and digits), spaces and dashes. Between 2 and 300 characters.',
                'regex' => '/^[a-zA-Z0-9- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/',
                'field' => 'address')
        ,
            'isCountry' => array(
                'description' => 'Only characters (letters, accentuated letters), spaces and dashes. Between 2 and 300 characters.',
                'regex' => '/^[a-zA-Z-ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/',
                'field' => 'country')
        ,
            'isInteger' => array(
                'description' => 'Only numeric values',
                'regex' => '/^[0-9]+$/')
        ,
            'isPhone' => array(
                'description' => 'Phone number format : 00/00/00/00/00 (separators allowed : ./- and space, no separator allowed, phone number begins with a zero).',
                'regex' => '/^0[0-9]([ \.-\/]?[0-9]{2}){4}$/',
                'field' => 'phone')
        ,
            'isZipcode' => array(
                'description' => 'Five digits',
                'regex' => '/^[0-9]{5}$/',
                'field' => 'zipcode')
        ,
            'isEmail' => array(
                'description' => 'Valid email (.extension between 2 and 6 characters)',
                'regex' => '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-z]{2,6}$/',
                'email' => 'email')
        ,
            'isKeyword' => array(
                'description' => 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.',
                'regex' => '/^[[:alpha:]A-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u')
        ,
            'isLocation' => array(
                'description' => 'Only characters (letters, accentuated letters and digits), spaces, dashes, underscore and slashes. Between 2 and 150 characters.',
                'regex' => '/^[[:alpha:]A-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u')
        ,
            'isPseudo' => array(
                'description' => 'Only letters, digits, dashes and underscore (accentuated letters excluded). Between 2 and 30 characters.',
                'regex' => '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u',
                'field' => 'pseudo')
        ,
            'isCivility' => array(
                'description' => '1 = Male, 2 = Female',
                'regex' => '/^[1-2]$/',
                'field' => 'civility')
        ,
            'isPassword' => array(
                'description' => 'At least 7 letters (accentuated included) and 1 digit. Between 8 and 16 characters. Special characters allowed : ".-_!@".',
                'regex' => array(
                    '/^[a-zA-Z[:alpha:]0-9\.\-_!@]{8,16}$/',
                    '/([A-Z[:alpha:]].*){7,}/i',
                    '/([0-9])/'),
                'field' => 'password'
            ),
            'isDate' => array(
                'description' => 'Format yyyy-mm-dd',
                'regex' => '@^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$@',
                'field' => 'birthday'
            ),
            'isCard' => array(
                'description' => '8 characters (letters, digits, accentuated letters excluded).',
                'regex' => '/^[0-9a-zA-Z]{8}$/',
                'field' => 'card'
            ),
            'isOptin' => array(
                'description' => 'boolean',
                'regex' => '/^[0-1]{1}$/i'
            ),
            'isMessage' => array(
                'description' => "Not a valid message : 30 to 400 characters, only letters, numbers, and these special characters : -_/",
                'regex' => '/^[[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ\n]{30,400}$/u'
            ),
            'isOtherid' => array(
                'description' => 'Only letters, digits, dashes and underscore. Between 4 and 256 characters.',
                'regex' => '/^[0-9a-zA-Z\-_ ]{4,256}$/')
        );
