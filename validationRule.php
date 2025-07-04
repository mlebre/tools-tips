<?php 

$validationRules = [
            'isName' => [
                'description' => $this->translator->trans('validation.isName', [], null, $langCode),
                'regex' => '/^[a-zA-Z- ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛ'.
                    'ÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,300}$/',
                'field' => ['lastname', 'firstname'], ],
            'isCity' => [
                'description' => $this->translator->trans('validation.isCity', [], null, $langCode),
                'regex' => '/^.{2,300}$/',
                'field' => ['city', 'country'], ],
            'isAddress' => [
                'description' => $this->translator->trans('validation.isAddress', [], null, $langCode),
                'regex' => '/^.{2,300}$/',
                'field' => 'address', ],
            'isEstablishment' => [
                'description' => $this->translator->trans('validation.isEstablishment', [], null, $langCode),
                'regex' => '/^[a-zA-Z0-9- \'ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖ'.
                    'ÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ<>%&]{2,300}$/', ],
            'isInteger' => [
                'description' => $this->translator->trans('validation.isInteger', [], null, $langCode),
                'regex' => '/^[0-9]+$/',
            ],
            'isPhone' => [
                'description' => $this->translator->trans('validation.isPhone', [], null, $langCode),
                'regex' => '/^(\+(9[976]\d|8[987530]\d|'.
                    '6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]'.
                    '|8[6421]|6[6543210]|5[87654321]'.
                    '|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14})?$/',
                'field' => 'phone', ],
            'isZipcode' => [
                'description' => $this->translator->trans('validation.isZipcode', [], null, $langCode),
                'regex' => '/^[0-9]{5}$/',
                'field' => 'zipcode', ],
            'isEmail' => [
                'description' => $this->translator->trans('validation.isEmail', [], null, $langCode),
                'regex' => '/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+'.
                    '_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/',
                'field' => 'email', ],
            'isKeyword' => [
                'description' => $this->translator->trans('validation.isKeyword', [], null, $langCode),
                'regex' => '/^[[a-zA-Z0-9 -_\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙ'.
                    'ÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{2,150}$/u', ],
            'isLocation' => [
                'description' => $this->translator->trans('validation.isLocation', [], null, $langCode),
                'regex' => '/^[[a-zA-Z0-9 ,\._\/ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖ'.
                    'ÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ-]{2,150}$/u', ],
            'isPseudo' => [
                'description' => $this->translator->trans('validation.isPseudo', [], null, $langCode),
                'regex' => '/^([a-zA-Z0-9-_]{2,30})|([a-zA-Z0-9\+_\-]+)'.
                    '(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/u',
                'field' => 'pseudo', ],
            'isCivility' => [
                'description' => $this->translator->trans('validation.isCivility', [], null, $langCode),
                'regex' => '/^[1-2]$/',
                'field' => 'civility', ],
            'isPassword' => [
                'description' => $this->translator->trans('validation.password', [], null, $langCode),
                'regex' => [
                    '/^[a-zA-Z[0-9\.\/\)\(€§\-_!,;:=+\'"#&@ÀÁÂÃÄÅÇÈÉÊËÌÍÎÏ'.
                    'ÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ]{8,16}$/',
                    // '/([A-Z[].*){7,}/i',
                    // '/([0-9])/'
                ],
                'field' => ['password', 'new_password'],
            ],
            'isDate' => [
                'description' => $this->translator->trans('validation.isDate', [], null, $langCode),
                'regex' => '/^(((19)(\d{2})|(20)([01])(\d{1}))-(0?[1-9]|1?[012])-(([012])'.
                    '([0-9])|(3[01])))|((([012])([0-9])|(3[01]))'.
                    '-(0?[1-9]|1?[012])-((19)(\d{2})|(20)([01])(\d{1})))$/',
                // 'regex' => '/^((0[1-9]|[12][0-9]|3[01])[\-\/\.](0[1-9]|1[012])[\-\/\.]
                // (19|20)\d\d)|((19|20)\d\d[\-\/\.](0[1-9]|1[012])[\-\/\.](0[1-9]|[12][0-9]|3[01]))$/',
                'field' => 'birthday',
            ],
            'isCard' => [
                'description' => $this->translator->trans('validation.isCard', [], null, $langCode),
                'regex' => '/^([0-9a-zA-Z]{8}|[0-9a-zA-Z]{13})$/',
                'field' => 'card',
            ],
            'isOauthId' => [
                'description' => $this->translator->trans('validation.isOauthId', [], null, $langCode),
                'regex' => '/^[0-9a-zA-Z]{8,45}$/',
                'field' => ['facebook_id', 'google_id'],
            ],
            'isOptin' => [
                'description' => $this->translator->trans('validation.isOptin', [], null, $langCode),
                'regex' => '/^[0-1]{1}$/i',
                'field' => ['opt_in', 'opt_in_client'],
            ],
            'isMessage' => [
                'description' => $this->translator->trans('validation.isMessage', [], null, $langCode),
                'regex' => '/^.{30,400}$/m',
            ],
            'isUuid' => [
                'description' => $this->translator->trans('validation.isUuid', [], null, $langCode),
                'regex' => '/^[a-zA-Z-0-9]{1,400}$/',
                'field' => ['uuid'],
            ],
            'isOtherid' => [
                'description' => $this->translator->trans('validation.isOtherid', [], null, $langCode),
                'regex' => '/^[0-9a-zA-Z\-_ ]{4,256}$/', ],
        ];

