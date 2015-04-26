<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Iugutest extends CI_Controller {

	

	public function CriaFatura(){
		$this->load->helper("iugu");
		setIuguAPIToken();		

		$carrinho = Array(
		    "email" => "apds.anderson@gmail.com",
		    "due_date" => "30/11/2014",
		    "items" => Array(
		        Array(
		            "description" => "Item Um",
		            "quantity" => "1",
		            "price_cents" => "1000"
		        )
		    ));

		$result = Iugu_Invoice::create($carrinho);

		$this->_debug($result);
	}

	public function BuscaFatura($fatura_id){
		$this->load->helper("iugu");

		setIuguAPIToken();
		$fatura = Iugu_Invoice::fetch($fatura_id);
		print_r($fatura['status']);
		print_r("</br>");
		print_r($fatura->status);
		print_r("</br>");
		print_r($fatura['items'][0]->quantity);
		$itens = $fatura['items'];
		foreach ($itens as $item) {
			print_r("</br>");
			print_r($item->quantity);
		}
		print_r("</br>");
		
		//print_r($fatura);
		
		echo '<pre>';
		print_r($fatura);
		echo '</pre>';
	}

	public function _debug($array){
		echo "<pre>";
		print_r($array);
		echo "</pre>";
	}

}