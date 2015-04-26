<?php
function is_browser() {
	$ci = get_instance();

	return $ci->agent->is_browser();
}

function is_mobile() {
	$ci = get_instance();

	return $ci->agent->is_mobile();
}