<?php


function span($env, $domain) {
    $host = $env . '-'.$domain;
    $span = "
    - host: $host
      http:
        paths:
        - backend:
            serviceName: feproxy
            servicePort: 80
          path: /";
    return $span;
}


$envs = ['test', 'test3', 'test4', 'test5', 'stage', 'stage1', 'stage2', 'stage3'];

$domains = [
    'yeebia-app.xgo.city',
    'yeebia.xgo.life',
    'yeebia.xgo.city',
    'yeebia-admin.xgo.city',
    'yeebia-merchant-admin.xgo.city',
    'com-gis-admin.xgo.city',
    'com-pay.xgo.city',
    'com-admin.xgo.city',
    'com-finance-admin.xgo.city',
    'com-pay-admin.xgo.city',
];


foreach ($domains as $domain) {
    foreach ($envs as $env) {
       
        $span = span($env, $domain);

        echo $span;
    }

}