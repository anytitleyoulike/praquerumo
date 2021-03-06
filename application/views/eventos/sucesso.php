<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<?php require_once("analytics-tracker.php");?>
		<title>Pagamento Realizado!</title>
		<!--<link rel="stylesheet" type="text/css" href="cjs/style.css"/>-->
	</head>
	<body>
		<center>
	<table width="640px" border="0">
		<tr>
			<td align="left" ><img src="<?=base_url('assets/images/emails/logo_pqr.png')?>" style="margin-top:22px; margin-left:37px; margin-bottom:16px;"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<table bgcolor="#E6E6E6" width="100%" height="79.144px" border="0" style="background-color:#E6E6E6;">
					<tr>
						<td align="justify">
							<img src="<?=base_url('assets/images/emails/icone_pagamentoverificado.png')?>" width="35px" height="35px" style="margin-left:37px; margin-top:24px; margin-bottom:27px;">
						</td>
						<td>
							<font style="margin-top:24px; margin-right:54px; color:#0CA86B;"><?=lang("success_mensagem")?></font>
							<font size="2px" style="color:#0CA86B;"><strong><?=lang("success_validade")?><?=dataMysqlParaPtBr($atividade["data"])?></strong></font>
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
				<table bgcolor="#1655A1" width="100%" height="39.572px" style="background-color:#1655A1;">
					<tr>
						<td>
							<font color="#FFF" style="margin-left:37px; font-size:12px;">
								<strong><?=lang("success_voucher")?></strong>
								<strong style="margin-left:69px;"><?=$compra['voucher']?></strong>
							</font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="40px">
				<strong style="color:#808080;"><?=lang("success_detalhes")?></strong>
			</td>
		</tr>
		<tr>
			<td align="left">
				<table border="1" width="312px" height="190px" cellspacing="0px">
					<tr>
						<td valign="top">
							<table>
								<tr>
									<td valign="top">
										<img src="<?=base_url('assets/images/emails/calendario_icone.png')?>" width="25px" height="25px" style="margin-left:5px; margin-top:5px;"/>
									</td>
									<td style="color:#808080;">
										<p style="margin-top:15px; margin-left:6px;"><strong><?=lang("success_atividade")?></strong>: <?=$atividade['titulo']?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong><?=lang("success_data")?></strong>: <?=dataMysqlParaPtBr($atividade["data"])?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong><?=lang("booking_sessao")?></strong>: <?=substr($atividade["horario"], 0,5)?></p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td align="right">
				<table border="1" width="312px" height="190px" cellspacing="0px">
					<tr>
						<td>
							<table width="100%" height="100%">
								<tr>
									<td valign="top" width="5%">
										<img src="<?=base_url('assets/images/emails/icone_reais.png')?>" width="25px" height="25px" style="margin-left:5px; margin-top:5px;"/>
									</td>
									<td valign="top" style="color:#808080;">
										<p style="margin-top:15px; margin-left:6px;"><strong><?=lang("success_valor_unitario")?></strong>: R$<?=$preco?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong><?=lang("details_booking_quantidade")?></strong>: <?=$compra["quantidade"]?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Subtotal</strong>: R$<?=$subtotal?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong><?=lang("success_desconto")?></strong>: R$<?=$valor_desconto?></p>
										<p style="margin-top:15px; margin-left:6px;"><strong>Total</strong>: <?=$total?></p>
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
									<td colspan='2' align='center'><font style='margin-top:12px; color:#808080;'><?=lang("success_cliente_dados")?></font></td>
								</tr>
								<tr>
									<td width='50%'><font style='margin-left:37px; color:#808080;'><strong><?=lang("user_nome")?></strong> <?=$usuario['nome']?></font></td>
									<td align='center'><font style='color:#808080;'><strong><?=lang("user_telefone")?></strong> <?=$usuario['telefone']?></font>:</td>
								</tr>
								<tr>
									<td colspan='2' width='50%'><font style='margin-left:37px; color:#808080;'><strong>E-mail</strong> <?=$usuario['email']?></font></td>
								</tr>
								<tr>
									<td colspan='2'><hr/></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
							<p style="color:#808080;" align="justify"><strong><?=lang("details_item_ponto_encontro")?></strong>: <?=$atividade['ponto_encontro']?></p>
						</td>
					</tr>
					<tr>
						<td align="left" colspan="2" style="color:#808080;">
							<p align="justify">
								<strong><?=lang("success_info_importante")?></strong>:<br/>
								a)  <?=lang("success_importante_a")?><br/>
								b)  <?=lang("success_importante_b")?><br/>
								c)  <?=lang("success_importante_c")?><br/>
							</p>
						</td>
					</tr>
					<tr>
						<td align="left" colspan="2" style="color:#808080;">
							<p align="justify">
								<strong><?=lang("success_dicas")?></strong>: <?=lang("success_dicas_info")?>
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
			</td>
		</tr>
	</table>
</center>
	</body>
</html>