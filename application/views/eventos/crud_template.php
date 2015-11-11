<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />

        <?php 
    foreach($css_files as $file): ?>
        <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
     
    <?php endforeach; ?>
    <?php foreach($js_files as $file): ?>     
        <script src="<?php echo $file; ?>"></script>
    <?php endforeach; ?>
     
    <style type='text/css'>
        body
        {
            font-family: Arial;
            font-size: 14px;
        }
        a {
            color: blue;
            text-decoration: none;
            font-size: 14px;
        }
        a:hover
        {
            text-decoration: underline;
        }        
    </style>

    <title>PRAQUERUMO - CRUD</title>

</head>
<body>
<!-- Beginning header -->
        <div>
        ==> Base de Dados :: 
        <a href='<?php echo site_url('crud/usuario')?>'>Usuários</a> |
        <a href='<?php echo site_url('crud/atividade')?>'>Atividades</a> |
        <a href='<?php echo site_url('crud/descricaoAtividade')?>'>Descrição da Atividades</a> |
        <a href='<?php echo site_url('crud/evento')?>'>Eventos</a> |
        <a href='<?php echo site_url('crud/desconto')?>'>Descontos</a> ===
        <!--<a href='<?php echo site_url('crud/elemento')?>'>Elementos</a> |
        <a href='<?php echo site_url('crud/categoria')?>'>Categorias</a> | 
        <a href='<?php echo site_url('crud/lingua')?>'>Línguas</a> === -->
        <a href='<?php echo site_url('crud/modalidade')?>'>Modalidades</a> | 
        <a href='<?php echo site_url('crud/acompanhamento')?>'>Acompanhamentos</a> |
        <a href='<?php echo site_url('crud/dica')?>'>Dicas</a> | 
        <a href='<?php echo site_url('crud/cuidado')?>'>Cuidados</a> ===
        <a href='<?php echo site_url('crud/avaliacaoAtividade')?>'>Avaliação</a>  |
        <a href='<?php echo site_url('crud/comentarioAtividade')?>'>Comentário</a>
    </div>

<!-- End of header-->
    <div style='height:20px;'></div>  
    <div>
        <?php echo $output; ?> 
    </div>
<!-- Beginning footer -->
<div></div>
<!-- End of Footer -->
</body>
</html>