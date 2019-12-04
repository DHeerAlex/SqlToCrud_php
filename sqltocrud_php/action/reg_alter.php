<?php
/*
on enregistre la page alter.sql
page alter
dossier action
projet sqltoCrud_php
date 01/11/2019
*/
$fichier = fopen('../sorties/'.$_GET['t'].'.php', 'c+b');
fwrite($fichier,$_POST['fichier']);
header('Location:../voir.php?t='.$_GET['t']);