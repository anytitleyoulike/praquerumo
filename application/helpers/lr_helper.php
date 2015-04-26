<?php
function getMessageErrorByLR($lr) {

	switch ($lr) {
		case '05':
			$message = "Transação não autorizada!";
			break;
		case '06':
			$message = "Tente novamente!";
			break;
		case '12':
			$message = "Transação inválida!";
			break;
		case '51':
			$message = "Saldo Insuficiente!";
			break;
		default:
			$message = "Transação não efetuada, tente novamente ou entre em contato com o suporte técnico";
			break;
	}

	return $message;
}