<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="cjs/style.css"/>
	</head>
	<body>
	<table width="640px" border="0">
		<tr>
			<td align="left" ><img src="<?=base_url('assets/images/emails/logo_pqr.png')?>" style="margin-top:22px; margin-left:37px; margin-bottom:16px;"/></td>
			<td align="right" >
				<h5 style="margin-top:36px; margin-right:46px; color:#0CA86B;">BOLETO EXPIRADO<br/><?echo date('d/m/Y');?></h5>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<table bgcolor="#E6E6E6" width="100%" height="79.144px" border="0">
					<tr>
						<td align="center">
							<font style="margin-top:24px; color:#0CA86B;"><strong>SEU BOLETO EXPIROU!</strong></font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<br/>
			</td>
		</tr>
		<tr>
			<td align="justify" colspan="2">
				<p style="margin-top:12px; color:#808080; font-size:12px; margin-left:37px; margin-right:46px; font-size:16px;">
					Olá <?=$nome?>,<br/>
					Tomamos conhecimento do seu pedido via <strong>BOLETO BANCÁRIO</strong>, mas infelizmente não identificamos seu pagamento.
				</p>
				<p style="margin-top:12px; color:#808080; font-size:12px; margin-left:37px; margin-right:46px;">
					Caso você ainda tenha interesse em participar dessa atividade, solicitamos que faça um novo pedido através do nosso site: <a href="<?=base_url("")?>"><?=base_url("")?></a>, pois, infelizmente não podemos gerar um novo boleto por e-mail.
				</p>
				<p style="margin-top:12px; color:#808080; font-size:12px; margin-left:37px; margin-right:46px;">
					Gostaríamos de lembrar que a fatura do <strong>BOLETO</strong> vale somente por 24 horas.
				</p>
				<p style="margin-top:12px; color:#808080; font-size:12px; margin-left:37px; margin-right:46px;">
					Caso tenha quaisquer perguntas, por gentileza não hesite em nos contactar pelo e-mail: <a href="mailto:contato@praquerumo.com.br">contato@praquerumo.com.br</a>
				</p>
				<p style="margin-top:12px; color:#808080; font-size:12px; margin-left:37px; margin-right:46px;">
					Atenciosamente,
					Equipe Pra QUe Rumo.
				</p>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<a href="<?=base_url("")?>"><img src="<?=base_url('assets/images/emails/icone_sitepqr.png')?>" width="30px" height="30px" /></a> 
				<a href="https://www.facebook.com/praquerumo"><img src="<?=base_url('assets/images/emails/icone_facebook.png')?>" width="30px" height="30px" /></a> 
				<a href="https://instagram.com/praquerumoficial/"><img src="<?=base_url('assets/images/emails/icone_instagram.png')?>" width="30px" height="30px" /></a> 
				<a href="https://plus.google.com/+PraquerumoBr"><img src="<?=base_url('assets/images/emails/icone_googleplus.png')?>" width="30px" height="30px" /></a> 
				<a href="https://twitter.com/PraQueRumo"><img src="<?=base_url('assets/images/emails/icone_twitter.png')?>" width="30px" height="30px" /></a> 
			</td>
		</tr>
	</table>
	</body>
</html>