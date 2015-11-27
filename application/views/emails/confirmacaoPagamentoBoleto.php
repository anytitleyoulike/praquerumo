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
			<td align="right" ><h5 style="margin-top:36px; margin-right:46px; color:#0CA86B;">AVENTURA RESERVADA</h5></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<table bgcolor="#E6E6E6" width="100%" height="79.144px" border="0">
					<tr>
						<td align="justify">
							<img src="<?=base_url('assets/images/emails/icone_pagamentoverificado.png')?>" width="35px" height="35px" style="margin-left:37px; margin-top:24px; margin-bottom:27px;">
						</td>
						<td>
							<font style="margin-top:24px; margin-right:54px; color:#0CA86B;">SUA <strong>COMPRA</strong> FOI REALIZADA COM SUCESSO!</font>
							<font size="2px" style="color:#0CA86B;">Validade:<?=$atividade["data"]?></font>
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
			<td colspan="2" align="center">
				<table bgcolor="#1655A1" width="100%" height="39.572px">
					<tr>
						<td>
							<font color="#FFF" style="margin-left:37px; font-size:12px;">
								<strong>N&Uacute;MERO DO VOUCHER:</strong>
								<strong style="margin-left:69px;"><?=$compra['voucher']?></strong>
							</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="40px">
				<strong style="color:#808080;">RESUMO DA COMPRA</strong>
			</td>
		</tr>
		<tr>
			<td align="left">
				<table border="1" width="312px" height="175px" cellspacing="0px">
					<tr>
						<td valign="top">
							<table>
								<tr>
									<td valign="top">
										<img src="<?=base_url('assets/images/emails/calendario_icone.png')?>" width="25px" height="25px" style="margin-left:5px; margin-top:5px;"/>
									</td>
									<td style="color:#808080;">
										<p style="margin-top:15px; margin-left:6px;"><strong>Atividade</strong>: <?=$atividade['titulo']?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Data</strong>: <?=$atividade["data"]?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Hora</strong>: <?=$atividade["horario"]?></p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td align="right">
				<table border="1" width="312px" height="175px" cellspacing="0px">
					<tr>
						<td>
							<table width="100%" height="100%">
								<tr>
									<td valign="top" width="5%">
										<img src="<?=base_url('assets/images/emails/icone_reais.png')?>" width="25px" height="25px" style="margin-left:5px; margin-top:5px;"/>
									</td>
									<td valign="top" style="color:#808080;">
										<p style="margin-top:15px; margin-left:6px;"><strong>Valor unitário</strong>: <?=$compra["preco"]?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Quantidade</strong>: <?=$compra["quantidade"]?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Subtotal</strong>: R$ <?=$compra["subtotal"]?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Desconto</strong>: R$ <?=$compra["desconto"]?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Valor Total</strong>: <?=$compra["total"]?></p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table width="557px" border="0" align="center">
					<tr>
						<td>
							<table width='100%' border='0'>
								<tr>
									<td colspan='2' align='center'><font style='margin-top:12px; color:#808080;'>DADOS DO CLIENTE</font></td>
								</tr>
								<tr>
									<td width='50%'><font style='margin-left:37px; color:#808080;'><strong>Nome</strong>: <?=$usuario['nome']?></font></td>
									<td align='center'><font style='color:#808080;'><strong>Tel</strong>: <?=$usuario['telefone']?></font></td>
								</tr>
								<tr>
									<td colspan='2' width='50%'><font style='margin-left:37px; color:#808080;'><strong>E-mail</strong>: <?=$usuario['email']?></font></td>
								</tr>
								<tr>
									<td colspan='2'><hr/></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<p style="color:#808080;" align="justify"><strong>Ponto de Encontro</strong>: <?=$atividade['ponto_encontro']?></p>
						</td>
					</tr>
					<tr>
						<td align="left" colspan="2" style="color:#808080;">
							<p align="justify">
								<strong>Informa&ccedil;&otilde;es Importantes</strong>:<br/>
								a)  Este voucher dever&aacute; ser apresentado ao fornecedor da atividade no ato de realiza&ccedil;&atilde;o;<br/>
								b)  A tolerância de chegada ao ponto de encontro ser&aacute; de 15 minutos;<br/>
								c)  Em caso de dúvidas ou cancelamento estaremos a diposi&ccedil;&atilde;o atrav&eacute;s do email: <a href='mailto:contato@praquerumo.com.br'>contato@praquerumo.com.br</a> ou pelo telefone: (92) 98112-1280.<br/>
							</p>
						</td>
					</tr>
					<tr>
						<td align="left" colspan="2" style="color:#808080;">
							<p align="justify">
								<strong>Dicas</strong>: Utilize sempre protetor solar, roupas claras e que protejam bem o corpo da radia&ccedil;&atilde;o.<br/>
								N&atilde;o se esque&ccedil;a de amarrar bem os &oacute;culos e c&acirc;meras fotogr&aacute;ficas &agrave; prova d'&aacute;gua.<br/>
								Procure se alimentar bem e venha bastante hidratado. N&atilde;o ser&aacute; oferecido nenhum tipo de transporte.
							</p>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<a href="http://www.praquerumo.com.br"><img src="<?=base_url('assets/images/emails/icone_sitepqr.png')?>" width="30px" height="30px" /></a> 
							<a href="https://www.facebook.com/praquerumo"><img src="<?=base_url('assets/images/emails/icone_facebook.png')?>" width="30px" height="30px" /></a> 
							<a href="https://instagram.com/praquerumoficial/"><img src="<?=base_url('assets/images/emails/icone_instagram.png')?>" width="30px" height="30px" /></a> 
							<a href="https://plus.google.com/+PraquerumoBr"><img src="<?=base_url('assets/images/emails/icone_googleplus.png')?>" width="30px" height="30px" /></a> 
							<a href="https://twitter.com/PraQueRumo"><img src="<?=base_url('assets/images/emails/icone_twitter.png')?>" width="30px" height="30px" /></a>  
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</body>
</html>