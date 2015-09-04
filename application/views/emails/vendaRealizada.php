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
			<td align="right" ><h5 style="margin-top:36px; margin-right:46px; color:#0CA86B;">VENDA REALIZADA</h5></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<table bgcolor="#E6E6E6" width="100%" height="79.144px" border="0">
					<tr>
						<td align="justify">
							<img src="<?=base_url('assets/images/emails/icone_pagamentoverificado.png')?>" width="35px" height="35px" style="margin-left:37px; margin-top:24px; margin-bottom:27px;">
						</td>
						<td>
							<font style="margin-top:24px; margin-right:90px; color:#0CA86B; margin-left:173px;"><strong>VENDA REALIZADA</strong></font>
							<font size="2px" style="color:#0CA86B;"><?=date("d/m/Y")?></font>
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
													<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Data</strong>: <?=$atividade["data"]?></p>
													<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Hora</strong>: <?=$atividade["horario"]?></p>
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
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Valor</strong>: <?=$compra["preco"]?></p>
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Quantidade:</strong>: <?=$compra["quantidade"]?></p>
															<p style="margin-top:15px; margin-left:6px; color:#FFF;"><strong>Valor Total</strong>: <?=$compra["total"]?></p>
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
						<td>
							<p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<br/>
				<table width="100%" border="0" align="center">
					<tr>
						<td>
							<table width="100%" border="0">
								<tr>
									<td colspan="3" align="center"><font style="margin-top:12px; color:#808080;">DADOS DO CLIENTE</font></td>
								</tr>
								<tr>
									<td width="50%"><font style="margin-left:37px; color:#808080;"><strong>Nome</strong>: <?=$usuario["nome"]?></font></td>
									<td align="center"><font style="color:#808080;"><strong>Tel</strong>: <?=$usuario["telefone"]?></font></td>
								</tr>
								<tr>
									<td colspan="3"><hr/></td>
								</tr>
								<tr>
									<td colspan="3"><font style="margin-left:37px; margin-right:69px; color:#808080;">Número do voucher:</font> <font style="color:#808080;"><?=$compra["voucher"]?></font> <font style="margin-left:82px; color:#808080;">validade: <?=$atividade["data"]?></font></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<p/>
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