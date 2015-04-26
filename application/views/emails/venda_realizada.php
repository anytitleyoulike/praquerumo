<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
	<title>Venda Realizada</title>

</head>
<body>
	<div>
		<table cellspacing="0" cellpadding="0" border="0" width="100%"
			dir="ltr"
			style="background-color: rgb(255, 255, 255); font-size: 16px">
			<tbody>
				<tr>
					<td align="center" valign="top" style="padding: 0; margin: 0">
						<table cellspacing="0" cellpadding="0" border="0" align="center"
							width="597" style="width: 597px">
							<tbody>
								<td align="center" valign="top" style="margin: 0; padding: 0">
										<table cellspacing="0" cellpadding="0" border="0"
											align="center" width="100%"
											style="margin-right: 0px; margin-left: 0px">
											<tbody>
												<tr>
													<td align="center" valign="top"
														style="padding: 40px 50px 0px; margin: 0px; line-height: 1.45; font-family: Helvetica, Trebuchet, Arial, sans-serif; color: rgb(28, 85, 165); background-color: rgb(255, 255, 255)">
														<table cellspacing="0" cellpadding="0" border="0"
															align="center" width="98"
															style="margin-right: 0px; margin-left: 0px">
															<tbody>
																<tr>
																	<td align="right" valign="middle" style="border-top: 8px solid rgb(255, 255, 255); padding: 0px; margin: 0px">
																		<a href="http:www.praquerumo.com.br"><img width="230" height="87" src="http://www.praquerumo.com.br/assets/images/emails/logo.png"style="border-width: 0px; margin-top: -23; border-style: none; border-color: transparent; display: block"></a>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td align="center" valign="top"
														style="padding: 40px 50px 0px; margin: 0px; line-height: 1.45; font-family: Helvetica, Trebuchet, Arial, sans-serif; color: rgb(28, 85, 165); background-color: rgb(255, 255, 255)">
														<div>
															<span style="color: rgb(0, 0, 0)"><span
																style="font-weight: bold"><font
																	face="Adobe Garamond Pro, serif" size="28"
																	style="font-size: 28px">Venda Realizada</font></span></span>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td align="center" valign="top" style="margin: 0; padding: 0">
										<table cellspacing="0" cellpadding="0" border="0"
											align="center" width="100%"
											style="margin-right: 0px; margin-left: 0px">
											<tbody>
												<tr>
													<td align="justify" valign="top"
														style="padding: 25px 50px 0px; margin: 0px; line-height: 1.45; font-family: Helvetica, Trebuchet, Arial, sans-serif; color: rgb(75, 75, 75); background-color: rgb(255, 255, 255)">
														<span
														style="font-family: Helvetica, Trebuchet, Arial, sans-serif; color: #4b4b4b; font-size: 18px; font-weight: normal">
													</span>
														<div class="box-1" style="width: 100%; height: auto;">
															<div class="box-left justify" style="margin-top: 30px;width: 70%;height: 100%;float: left; text-align: justify;">
																<span class="bold" style="font-weight: bold;">Atividade:</span><br/>
<?=$atividade['titulo']?><br/>
																<span class="bold" style="font-weight: bold;">Ponto de Encontro:</span><br/>
<?=$atividade['ponto_encontro']?>
</div>
															<div class="box-right" style="margin-top: 30px;width: 25%; height: 100%; float: right;padding-left: 20px;">
																<span class="bold" style="font-weight: bold;">Data:</span><br/>
<?=$atividade['data']?><br/>
																<span class="bold" style="font-weight: bold;">Horário:</span><br/>
<?=$atividade['horario']?><br/>
															</div>
														</div>
														<div class="clear" style="clear: both;"></div>
														<div class="box" style="border-top: thick solid black;margin-top: 30px;padding-top: 10px;width: 100%;height: auto;">
																<span class="box-title" style="text-align:center;font-weight: bold;font-size: 18px;display: block;margin-bottom: 20px;">Dados do Cliente</span>
																<span class="bold" style="font-weight: bold;">Nome: </span><?=$usuario['nome']?><br/>
																<span class="bold" style="font-weight: bold;">Email: </span><?=$usuario['email']?><br/>
																<span class="bold" style="font-weight: bold;">Tel: </span><?=$usuario['telefone']?><br/>
														</div>
														<div class="clear" style="clear: both;"></div>
														<div class="box" style="border-top: thick solid black;margin-top: 30px;padding-top: 10px;width: 100%;height: auto;">
																<span class="payment-date" style="display:block;font-size: 12px;text-align:right;">Data da compra: <?=$compra['data_compra']?></span>
																<span class="box-title" style="text-align:center;font-weight: bold;font-size: 18px;display: block;margin-bottom: 20px;">Resumo da Compra</span>
																<div class="content-paid">
																	<table class="content-table" style="table-layout: fixed;border: 1px solid black;width: 100%;text-align: center;">
																		<thead>
																			<tr>
																				<th width="64%" style="padding: 15px;border: 1px solid grey;">Produto</th>
																				<th width="20%" style="padding: 15px;border: 1px solid grey;">Quantidade</th>
																				<th width="16%" style="padding: 15px;border: 1px solid grey;">Preço</th>
																			</tr>
																		</thead>
																		<tbody>
																			<!-- Comeco Conteudo -->
																			<tr>
																				<td style="border: 1px solid grey;"><?=$atividade['titulo']?></td>
																				<td style="border: 1px solid grey;"><?=$compra['quantidade']?></td>
																				<td style="border: 1px solid grey;">R$ <?=$compra['preco']?></td>
																			</tr>
																			<!-- Fim Conteudo -->
																			<tr>
																				<td width="85%" colspan="2" style="border: 1px solid grey;"><b>Subtotal:</b></td>
																				<td width="15%" style="border: 1px solid grey;">R$ <?=$compra['subtotal']?></td>
																			</tr>
																			<tr>
																				<td width="85%" colspan="2" style="border: 1px solid grey;"><b>Total da Compra:</b></td>
																				<td width="15%" style="border: 1px solid grey;">R$ <?=$compra['total']?></td>
																			</tr>
																		</tbody>
																	</table>
																	<div class="box-voucher" style="width: 60%;margin: 20px auto 60px auto;border: 7px solid black;text-align: center;color: black;font-weight: bold;">
																		<span class="voucher-text" style="font-style: italic;display: block;font-size: 16px;">Voucher</span>
																		<span class="voucher-number" style="font-size: 14px;"><?=$compra['voucher']?></span>
																	</div>

																</div>
														</div>
														<div class="box-2" style="font-size: 12px;">
															<span class="box-2-title" style="font-weight: bold;">Informações Importantes:</span><br/>
															<ul>
																<li>É obrigatório a apresentação desse voucher no ato de realização da atividade e o preenchimento do termo de reconhecimento de risco pelo participante.</li>
																<li>A tolerância de chegada ao ponto de encontro para o participante será de 15min. Sendo responsabilidade do organizador e de sua equipe estar a disposição 45 min antes do horário marcado.</li>
																<li>Em caso de dúvidas ou cancelamento estaremos à disposição através do email contato@praquerumo.com.br</li>
															</ul>

															<span class="box-2-title" style="font-weight: bold;">Dicas:</span> Seja atencioso e antes de realizar a atividade faça uma detalhada instrução sobre os equipamentos e o
percurso e também não esqueça de fazer um bom alongamento com o grupo.
														</div>
														<div class="footer">
														</div>
															<font face="Adobe Garamond Pro, serif"><br></font>
														</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>

								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<td></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>