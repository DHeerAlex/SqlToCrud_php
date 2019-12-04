<?php
/*
on enregistre la page create.sql
page create
dossier action
projet sqltoCrud_php
date 01/11/2019
*/
$fichier = fopen('../sorties/create.sql', 'c+b');
fwrite($fichier,$_POST['fichier']);
header('Location:../create.php');