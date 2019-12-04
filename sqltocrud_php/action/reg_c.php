<?php
/*
on enregistre la page create.sql
page create
dossier action
projet sqltoCrud_php
date 01/11/2019
*/
$fichier = fopen('../sorties/'.$_GET['t'].'.php', 'c+b');

$c = "public function C {".$_POST['fichier']."}";
fwrite($fichier,$c);
header('Location:../create.php');