<?php
/*
page index
dossier sqltoCrud_php
date 01/11/2019
*/
$listeDebutCreate = array();
$listeFinCreate = array();

$listeTables = array();
if(file_exists('source/create.sql')){
	$lines = file('source/create.sql');
	// echo fread($ressource,filesize('source/source.sql'));
	
	foreach ($lines as $lineNumber => $lineContent){
		if(stristr($lineContent,"Create table")){
			$string = preg_split("/ /",$lineContent);
			// echo $lineNumber,' ',$table."<br/>";
			$table = preg_split("/`/",$string[2]);
			// var_dump($string2);
			if($table[0] === ""){
				// echo $lineNumber,' ',$table[1]."<br/>";
				array_push($listeTables,$table[1]);
			} else {
				// echo $lineNumber,' ',$table[0]."<br/>";
				array_push($listeTables,$table[0]);
			}
			// array_push($listeTables,$table);
		}
	}
}

?>
<!Directory html>
<html>
<head>
<title>Outil pour CRUD</title>
</head>
<body>
<section>
<table>
<tr>
<th>Table</th>
</tr>
<?php
foreach($listeTables as $table){
	?>
<tr>
<td><?=$table;?></td>
<?php
if(!file_exists("sorties/".$table.".php")){?>
<td><a href="action/create.php?t=<?php echo $table;?>" /><input type="button" value="Créer"/></a></td>
<?php
} else {
?>
<td><a href="voir.php?t=<?=$table;?>" /><input type="button" value="Voir"/></a></td>
<td><a href="modif.php?t=<?=$table;?>" /><input type="button" value="Modifier"/></a></td>
<?php
}
?>
</tr>
<?php
}
?>
</table>
</section>
</body>
</html>