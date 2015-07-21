<?php 
    $config['error_prefix'] = '<div class="error_prefix has-error">';
    $config['error_suffix'] = '</div>';

	$config = array(
        array(
	        'field' => 'nome',
	        'label' => 'Nome',
	        'rules' => 'required'
        ),
        array(
        	'field' => 'telefone',
        	'label' => 'Telefone',
        	'rules' => 'required'
        ),
        array(
            'field' => 'username',
            'label' => 'Usuário',
            'rules' => 'required'
        ),
        array(
            'field' => 'senha',
            'label' => 'Senha',
            'rules' => 'required|min_length[3]|max_length[20]|'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|valid_email|'
        )
);
    

?>

