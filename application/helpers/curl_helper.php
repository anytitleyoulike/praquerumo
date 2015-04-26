<?php

function post($url_post, $data, $type, $api_key = null){

	//define post values
	 $url=$url_post;//encode the message
	 //$message = urlencode("teste de mensagem");//initialize the curl
	 $ch = curl_init();

	if (!$ch){
		die("Couldn't initialize a cURL handle");
	}//setting options

	$headers = array("Content-Type:multipart/form-data");

	$ret = curl_setopt($ch, CURLOPT_URL,$url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
	curl_setopt ($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
	//setup user
	if($api_key != null){
		curl_setopt($ch, CURLOPT_USERPWD, "$api_key:");
	}

	//setup post fields
	switch ($type) {
			case 'saveSubAccount':
				$encoded_data = http_build_query($data);
				break;
			case 'requestVerification':
				$encoded_data = http_build_query($data, '', ';');
				break;
			default:
				return ;
				break;
		}

	curl_setopt ($ch, CURLOPT_POSTFIELDS,http_build_query($data, '', ';'));
	$ret = curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	//If you are behind proxy then please uncomment below line and provide your proxy ip with port.
	// $ret = curl_setopt($ch, CURLOPT_PROXY, "PROXY IP ADDRESS:PORT");

	//execute and geting response
	$curlresponse = curl_exec($ch);

	if(curl_errno($ch)){
		echo 'curl error : '. curl_error($ch);

		return null;
	}

	if (empty($ret)) {
		// some kind of an error happened
		die(curl_error($ch));
		curl_close($ch); // close cURL handler

		$info = curl_getinfo($ch);
		print_r($info);


		return null;
	}
	else {
		$info = curl_getinfo($ch);
		curl_close($ch); // close cURL handler

		echo "<pre>";
		print_r($info);

		$json = json_decode($curlresponse);
		print_r($json);
		echo "</pre>";

		return $json;
	}

}

function request($agent){

	$target="http://postcatcher.in/catchers/5477db5fbe0e0a02000006d5";
	# http://php.net/manual/en/curlfile.construct.php

	$url = $target; // e.g. http://localhost/myuploader/upload.php // request URL
	$filename = "Cpf_tayke";
	$filedata = base_url("assets/contas/tayke_monteiro/cpf.png");
	$filesize = filesize("../../assets/contas/tayke_monteiro/cpf.png");
	echo $filesize;
    $headers = array("Content-Type:multipart/form-data"); // cURL headers for file uploading
    $postfields = array("filedata" => "@$filedata", "filename" => $filename);
    $ch = curl_init();
    $options = array(
        CURLOPT_URL => $url,
        CURLOPT_HEADER => true,
        CURLOPT_POST => 1,
        CURLOPT_HTTPHEADER => $headers,
        CURLOPT_POSTFIELDS => $postfields,
        CURLOPT_INFILESIZE => $filesize,
        CURLOPT_RETURNTRANSFER => true
    ); // cURL options
    curl_setopt_array($ch, $options);
    curl_exec($ch);
    if(!curl_errno($ch))
    {
        $info = curl_getinfo($ch);
        if ($info['http_code'] == 200)
            $errmsg = "File uploaded successfully";
    }
    else
    {
    	$info = curl_getinfo($ch);
        $errmsg = curl_error($ch);
    }
    curl_close($curl);
	echo "<pre>";
		print_r($info);
		print_r($errmsg);
	echo "</pre>";

	print_r($r);
}
