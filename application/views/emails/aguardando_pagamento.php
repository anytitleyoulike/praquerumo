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
			<td align="right" ><h5 style="margin-top:36px; margin-right:46px; color:#0CA86B;">INTENÇÃO DE COMPRA<br/>Data:<?=date("d/m/Y")?></h5></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<table bgcolor="#E6E6E6" width="100%" height="79.144px" border="0">
					<tr>
						<td align="center">
							<font style="margin-top:24px; color:#0CA86B;"><strong>AGUARDANDO PAGAMENTO</strong></font>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td align="justify">
							<p style="margin-top:12px; color:#808080; font-size:12px; margin-left:37px;">
								Olá,<br/>
								Tomamos conhecimento do seu pedido via <strong>BOLETO BANCÁRIO</strong> e estamos felizes pelo seu interesse em nossas atividades!
							</p>
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
						<td colspan="2" align="center" height="40px">
							<strong style="color:#FFF;">RESUMO DA COMPRA</strong>
						</td>
					</tr>
					<tr>
						<td align="left">
							<table border="1" width="312px" height="109px" cellspacing="0px" style="border-color:#FFF;">
								<tr>
									<td>
										<table>
											<tr>
												<td valign="top">
													<img src="<?=base_url('assets/images/emails/iconcebranco.png')?>" width="25px" height="25px" style="margin-left:5px; margin-top:5px;"/>
												</td>
												<td>
													<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Atividade</strong>: <?=$atividade["titulo"]?></p>
													<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Data</strong>: <?=dataMysqlParaPtBr($atividade["data"])?></p>
													<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Hora</strong>:<?=substr($atividade["horario"], 0,5)?></p>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
								<td align="right">
									<table border="1" width="312px" height="109px" cellspacing="0px" style="border-color:#FFF;">
										<tr>
											<td>
												<table width="100%" height="100%">
													<tr>
														<td valign="top" width="5%">
															<img src="<?=base_url('assets/images/emails/iconebranco2.png')?>" width="25px" height="25px" style="margin-left:5px; margin-top:5px;"/>
														</td>
														<td valign="top">
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Valor unitário</strong>: R$ <?=$preco?></p>
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Quantidade</strong>: <?=$compra["quantidade"]?></p>
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Subtotal</strong>: R$ <?=$subtotal?></p>
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Desconto</strong>: R$ -<?=$preco_com_desconto?></p>
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Valor Total</strong>: R$ <?=$total?></p>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</td>
					</tr>
					<tr>
						<td colspan='2'>
							<table width='100%' border='0' align='center'>
								<tr>
									<td colspan='2' align='center'><font style='margin-top:12px; color:#808080;'>DADOS DO CLIENTE</font></td>
								</tr>
								<tr>
									<td width='50%'><font style='margin-left:37px; color:#808080;'><strong>Nome</strong>: <?=$nome?></font></td>
									<td align='center'><font style='color:#808080;'><strong>Tel</strong>: <?=$celular?></font></td>
								</tr>
								<tr>
									<td colspan='2' width='50%'><font style='margin-left:37px; color:#808080;'><strong>E-mail</strong>: <?=$email?></font></td>
								</tr>
								<tr>
									<td colspan='2'><hr/></td>
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
							<table width="100%">
								<tr>
									<td>
										<p style="margin-top:12px; color:#808080; font-size:12px;">
											Você já deve ter recibo sua fatura do <strong>BOLETO</strong> quando foi redirecionado após a solicitação em
											nosso site. Por gentileza, imprima a página referente ao boleto e leve-a com você para realizar
											o pagamento. Você pode efeturar o pagamento na maioria dos bancos ou através do site de seu banco.
										</p>
										<p style="margin-top:12px; color:#808080; font-size:12px;">
											É imporante lembrar que sua fatura pelo <strong><a href="<?=$url?>">BOLETO</a></strong> vale somente por 24 horas!
										</p>
										<p style="margin-top:12px; color:#808080; font-size:12px;">
											Se você não imprimir sua fatura, infelizmente não poderemos fornecer uma cópia. E se por acaso isso acontecer, faça um novo pedido em nosso site: <a href="http://www.praquerumo.com.br">www.praquerumo.com.br</a>
										</p>
										<p style="margin-top:12px; color:#808080; font-size:12px;">
											Depois de realizar o pagamento, pode levar até 1 dia útil para recebermos a confirmação. E para
											agilizar esse processo de confirmação, gostaríamos que nos enviasse o comprovante de pagamento por anexo para esse e-mail. Depois disso, enviaremos seu voucher para seu e-mail.
										</p>
										<p style="margin-top:12px; color:#808080; font-size:12px;">
											Caso tenha quaisquer perguntas, por gentileza não hesite em nos contactar pelo e-mail: <a href="mailto:contato@praquerumo.com.br">contato@praquerumo.com.br</a>
										</p>
										<p style="margin-top:12px; color:#808080; font-size:12px;">
											Atenciosamente,<br/>
											Equipe Pra Que Rumo.
										</p>
									</td>
								</tr>
							</table>
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