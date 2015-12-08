<html>
	<body>

		<table>

			<tr>
				<td>
				Nome: <?=$user?>
				</td>
			<tr>
				<td>
				Email: <?= $iugu['email']?>
				</td>
			<tr>
				<td>
				Atividade: <?= $atividade?>
				</td>
			<tr>
				<td>
				<?php $erro = (empty($iugu['message']) ? $iugu['errors'] : $iugu['message']); ?>
				Erro: <?= $erro?>
				</td>
			<tr>
				<td>
				LR: <?= $iugu['LR']?>
				</td>
		</table>

	</body>
</html>