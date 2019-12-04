<?php
/*
page index
dossier sqltoCrud_php
date 01/11/2019
*/
$listeDebutCreate = array();
$listeFinCreate = array();

$listeDebutAlter = array();
$file = $_GET['t'].'.php';
$path = 'sorties/'.$file;


?>
<!Directory html>
<html>
<head>
<title>Outil pour CRUD</title>
</head>
<body>
<section>
<a href="index.php"><input type="button" value='Acceuil'/></a>
<a href="modif.php?t=<?=$_GET['t'];?>"><input type="button" value='Modifier'/></a>
</section>
<section style="position:fixed;top:48px;left:0px;bottom:45px;">
	<textarea name="fichier" rows="90" cols=60 style="overflow-y:scroll;resize:none;height:500px;">
		<?php
		if(isset($_GET['t'])){
			if(file_exists($path)){
				$lines = file($path);
				foreach ($lines as $lineNumber => $lineContent){
					echo $lineNumber,' ',$lineContent."";
				}
			} else {
				echo "Le fichier n'existe pas!";
				echo $path;
			}
		}
		?>
	</textarea>
</section>
</body>
</html>