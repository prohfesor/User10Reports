<?php

/* SRC: http://www.vijayjoshi.org/2011/01/12/php-shorten-urls-using-google-url-shortener-api/ */

function google_shortener($url)
{

    $apiKey = 'AIzaSyD62RsjVz-KFz2zg0o4p5D2qZqMWf3_m7U';
    $postData = array('longUrl' => $url, 'key' => $apiKey);
    $jsonData = json_encode($postData);

    $curlObj = curl_init();

    curl_setopt($curlObj, CURLOPT_URL, 'https://www.googleapis.com/urlshortener/v1/url');
    curl_setopt($curlObj, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curlObj, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($curlObj, CURLOPT_HEADER, 0);
    curl_setopt($curlObj, CURLOPT_HTTPHEADER, array('Content-type:application/json'));
    curl_setopt($curlObj, CURLOPT_POST, 1);
    curl_setopt($curlObj, CURLOPT_POSTFIELDS, $jsonData);

    $response = curl_exec($curlObj);

    $json = json_decode($response);
    //echo 'Shortened URL is: '.$json->id;
    //var_dump($json); die();
    curl_close($curlObj);

    if(isset($json->id)) {
        return $json->id;
    }
    return false;
}
