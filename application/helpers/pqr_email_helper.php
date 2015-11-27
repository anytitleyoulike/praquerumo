<?php

function send_email($to, $subject, $content) {
	$ci = get_instance();
	$ci->load->library("email");
	$config["protocol"] = "smtp";
	$config["smtp_host"] = "mail.praquerumo.com.br";
	$config["smtp_user"] = "contato@praquerumo.com.br";
	$config["smtp_pass"] = "pr4qu3rum0";
	$config["charset"] = "utf-8";
	$config["mailtype"] = "html";
	$config["newline"] = '\r\n';
	$config["smtp_port"] = "587";
	$ci->email->initialize($config);

	$ci->email->from("contato@praquerumo.com.br", "PRAQUERUMO");
	$ci->email->to($to);
	$ci->email->subject($subject);
	$ci->email->message($content);

	if (defined('ENVIRONMENT') && ENVIRONMENT != 'development') {
		$ci->email->send();
	} else {
		$ci->email->to("matheusbzevedo@gmail.com");
		$ci->email->send();
	}

}

function sendgrid_newsletter($email,$content) {
	$ci = get_instance();
	$ci->email->initialize(array(
			'protocol' => 'smtp',
			'smtp_host' => 'smtp.sendgrid.net',
			'smtp_user' => 'praquerumo',
			'smtp_pass' => '@tt171423',
			'smtp_port' => 587,
			'crlf' => "\r\n",
			'newline' => "\r\n"
		));
		

		$ci->email->from('suporte@praquerumo.com', 'Contato PQR');
		$ci->email->subject('Confirmação de Email');

		$ci->email->to($email);
		$ci->email->message($content);
		$ci->email->send();
}