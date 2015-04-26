<?php
function numeroEmReais($numero) {
	if($numero > 0)
		$result = "R$ " . number_format($numero, 2, ",", ".");
	else $result = "R$ 0,00";
	
	return $result;
}