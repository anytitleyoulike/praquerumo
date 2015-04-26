<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<link href="<?= base_url("assets/css/bootstrap.css")?>" rel="stylesheet" media="screen">
    
	<title>Email de Confirmação de Pagamento</title>
</head>

<body>
	<h1>Cliente Efetuou pagamento</h1><br/>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<td>Evento</td>
					<td>Voucher</td>
					<td>Nome</td>
					<td>Data</td>
					<td>Quantidade</td>
					<td>Valor</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><?= $evento?></td>
					<td><?= $voucher?></td>
					<td><?= $nome?></td>
					<td><?= $data_horario?></td>
					<td><?= $quantidade?></td>
					<td><?= $preco?></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/><br/>
	Equipe PRAQUERUMO.
</body>