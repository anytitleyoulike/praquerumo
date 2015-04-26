<?php

function dataPtBrParaMysql($dataPtBr) {
	$partes = explode("/", $dataPtBr);
	return "{$partes[2]}-{$partes[1]}-{$partes[0]}";
}

function dataMysqlParaPtBr($dataMysql) {
	$data = new DateTime($dataMysql);
	return $data->format("d/m");
}

function getDayData($dataMysql) {
	$data = new DateTime($dataMysql);
	return $data->format("d");
}

function getMonthNameData($dataMysql) {
	return strftime("%b", strtotime($dataMysql));
}

function getMonthFullNameData($dataMysql) {
	return strftime("%B", strtotime($dataMysql));	
}

function getSessionTime($dataMysql) {
	$data = new DateTime($dataMysql);
	return $data->format("H:s");	
}

function agrupaPorData($registros) {
	$eventos = null;
		
	foreach ($registros as $registro) {
		$data = $registro['data_inicio'];
		$eventos[$data][] = array('inicio' => $registro['hora_inicio'], 'fim' => $registro['hora_fim'],
			'disponivel' => $registro['disponivel'], 'preco' => $registro['preco'],
			'codigo' => $registro['codigo']);
	}
	return $eventos;
}

function datetime_now(){
	return date('Y-m-d H:i:s');
}

?>