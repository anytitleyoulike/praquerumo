<?php
class LanguageLoader
{
    function initialize() {
        $ci =& get_instance();
        $site_lang = $ci->session->userdata('site_lang');
        
        if ($site_lang) {
        	$ci->lang->load('texto',$ci->session->userdata('site_lang'));
        } else {
        	$ci->lang->load('texto','portuguese-br');
        }
    }
}