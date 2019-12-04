<?php
/*
on crée la page create.sql
page create
dossier action
projet sqltoCrud_php
date 01/11/2019
*/

$fichier = fopen('../sorties/'.$_GET['t'].'.php', 'c+b');

header('Location:../index.php');