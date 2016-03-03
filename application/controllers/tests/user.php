<?php if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

class User extends CI_Controller{

	public function index(){
		$link = base_url("assets/images/emails/logo.png");
		echo "<a href= ". $link .">". $link ." </a>";
	}

	public function teste(){
		$data['link'] = "https://www.praquerumo.com.br/verifica/asdas12312as324324";
		$this->load->view("newsletter/confirmacao.php");
	
	}

	public function createSubAccount($name, $percent){
		$this->load->helper("curl");
		$type = 'saveSubAccount';
		//$api_key = "17719f939e0983d2b73fe02003bc906f"; #live api_token
		$api_key = "a446d1b1bfa063746f198a0e51903dca"; #test api_token
		$url = "https://api.iugu.com/v1/marketplace/create_account";
		$data = array(
			'name' => $name,
			'commission_percent' => $percent
			);

		$result = post($url, $data, $type, $api_key);
		$this->_dump($type,$result);
	}

	##############################################

// curl https://api.iugu.com/v1/accounts/539810E2EB464A7EA057C553161AEAD9/request_verification -u e04c47d427d3b1edbf963fdc4b7f9797: -F "data[price_range]=Até R$ 100,00" -F "data[physical_products]=false" -F "data[business_type]=Serviços de Limpeza" -F "data[person_type]=Pessoa Física" -F "data[automatic_transfer]=true" -F "data[cpf]=008.800.482-12" -F "data[name]=Tayke Hedjho Tenório Monteiro" -F "data[address]=Vila Militar, Rua B 301, Bairro: São Jorge" -F "data[cep]=69030-730" -F "data[city]=Manaus" -F "data[state]=Amazonas" -F "data[telephone]=92-99353-1716" -F "data[bank]=Itaú" -F "data[bank_ag]=1234" -F "data[account_type]=Corrente" -F "data[bank_cc]=11231-2" -F "files[id]=@cpf.png" -F "files[cpf]=@cartao.jpg" -F "files[activity]=@cartao.jpg"

	##############################################

	public function requestVerification($id){
		$this->load->helper("curl");
		$type = 'requestVerification';
		//$api_key = "17719f939e0983d2b73fe02003bc906f"; #live api_token
		$api_key = "e04c47d427d3b1edbf963fdc4b7f9797"; #test api_token subaccount
		$url = "https://api.iugu.com/v1/accounts/$id/request_verification";
		$data = array(
			'data' => array(
					'price_range' => 'Até R$ 100,00',
					'physical_products' => 'false',
					'business_type' => 'Agente de turismo',
					'person_type' => 'Pessoa Física',
					'automatic_transfer' => 'true',
					'cnpj' => '',
					'company_name' => '',
					'cpf' => '008.800.482-12',
					'name' => 'Tayke Hedjho Tenório Monteiro',
					'address' => 'Vila Militar, Rua B 301, Bairro: São Jorge',
					'cep' => '69030-730',
					'city' => 'Manaus',
					'state' => 'AM',
					'telephone' => '',
					'resp_name' => '',
					'resp_cpf' => '',
					'bank' => 'Caixa Econômica',
					'bank_ag' => '2980',
					'account_type' => 'Poupança',
					'bank_cc' => '00032523-2'
				),
			'files' => array(
					'id' => '@'. base_url('assets/contas/tayke_monteiro/cpf.png'),
					'cpf' => '@' . base_url('assets/contas/tayke_monteiro/cartao.jpg'),
					'activity' => '@' . base_url('assets/contas/tayke_monteiro/cartao.jpg')
				)
			);

		//echo http_build_query($data, '', ';');
		echo "Before posting...";
		$result = post($url, $data, $type, $api_key);
		echo "After Posting...";
		$this->_dump($type,$result);
	}

	function _dump($type, $result) {

		$data = print_r($result, 1);

		switch ($type) {
			case 'saveSubAccount':
				$fd = @fopen("accounts.log", "a");
				break;
			case 'requestVerification':
				$fd = @fopen("resquestVerification.log", "a");
				break;
			default:
				return ;
				break;
		}
		fwrite($fd, "\n");
		fwrite($fd, "**** Iniciando " . $type . " ****" . datetime_now());
		fwrite($fd, "\n");
		fwrite($fd, $data);
		fwrite($fd, "**** Finalizando " . $type . " ****" . datetime_now());
		fclose($fd);
	}

	public function createTest(){
		$this->load->helper("curl");
		$url = "http://postcatcher.in/catchers/5477db5fbe0e0a02000006d5";

		$data = array(
			'name' => 'Tayke',
			'commission_percent' => '20'
		);

		post($url, $data);
	}

	public function requestTest(){
		$this->load->helper("curl");
		$this->load->helper('file');
		$this->load->library('user_agent');
		echo "Before posting...";
		$path = base_url("assets/images/usuarios/cpf.png");
		echo $path;
		//$path = "../../assets/contas/tayke/cpf.png";
		var_dump(get_file_info($path));


		if(file_exists($path))
			echo "exists";
		else
			echo "not exists";

		//$filesize = filesize();
		//echo $filesize;
		//request($this->agent->agent_string());
		echo "After Posting...";
	}

}