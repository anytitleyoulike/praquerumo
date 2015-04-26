<?php if (!defined('BASEPATH')) {exit('No direct script access allowed');
}

class Emailtest extends CI_Controller {

	private $to = 'apds.anderson@gmail.com';

	public function sucessoCartao() {
		$this->load->template("eventos/sucesso");
	}

	public function sendConfirmacao() {
		$this->load->helper('pqr_email');
		$subject = "Confirmacao de pgto";

		$data = array(
			'voucher' => '11111111111111111111111111111111',
			'nome' => 'Anderson Pimentel dos Santos',
			'data_hora' => '12 de junho de 2014',
			'quantidade' => '10',
			'preco' => 'R$ 100,00',
			'descricao' => 'Sup das aventuras do Tupé',
		);

		$conteudo = $this->load->view('emails/confirmacao_tabela', $data, TRUE);

		send_email($this->to, $subject, $conteudo);
	}

	public function sendCancelamento() {
		$this->load->helper('pqr_email');
		$subject = "Cancelamento de boleto";

		$data = array(
			'voucher' => '11111111111111111111111111111111',
			'nome' => 'Anderson Pimentel dos Santos',
			'data_hora' => '12 de junho de 2014',
			'quantidade' => '10',
			'preco' => 'R$ 100,00',
			'descricao' => 'Sup das aventuras do Tupé',
		);

		$conteudo = $this->load->view('emails/cancelamento_tabela', $data, TRUE);

		send_email($this->to, $subject, $conteudo);
	}

	public function sendNaoChegouNoMinimo() {

	}

	public function sendConfirmacaoOrganizador() {

	}

	public function sendListaConfirmados() {

	}

	public function sendConfirmacaoPQR() {

	}

	public function sendListaConfirmadosPQR() {

	}

	public function sendCancelamentoPQR() {

	}

	public function sendNaoChegouNoMinimoPQR() {

	}

}