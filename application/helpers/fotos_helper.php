<?php

function getDestaques() {
	$dir = base_url("/assets/images/destaques");
	
	$destaques = array ($dir . "/1.jpg", $dir . "/2.jpg", $dir . "/3.jpg", 
		$dir . "/4.jpg", $dir . "/5.jpg" );

	return $destaques;
}