<?php
/*
page index
dossier sqltoCrud_php
date 01/11/2019
*/
$listeDebutCreate = array();
$listeFinCreate = array();

$listeDebutAlter = array();
$listeDebutAlter_key = array();
if(isset($_GET['t'])){
$file = $_GET['t'].'.php';
$path = 'sorties/'.$file;
}
?>
<!Directory html>
<html>
<head>
<title>Outil pour CRUD</title>
</head>
<body>
<section>
<a href="index.php"><input type="button" value='Acceuil'/></a>
<a href="modif.php"><input type="button" value='Modifier'/></a>
</section>
<section>
<a href="modif.php?t=<?=$_GET['t'];?>&o=e1"><input type="button" value='Ent'/></a>
<a href="modif.php?t=<?=$_GET['t'];?>&o=c"><input type="button" value='C'/></a>
<a href="modif.php?t=<?=$_GET['t'];?>&o=r"><input type="button" value='R'/></a>
<a href="modif.php?t=<?=$_GET['t'];?>&o=u"><input type="button" value='U'/></a>
<a href="modif.php?t=<?=$_GET['t'];?>&o=d"><input type="button" value='D'/></a>
<a href="modif.php?t=<?=$_GET['t'];?>&o=l"><input type="button" value='L'/></a>
</section>
<section style="position:fixed;top:48px;left:0px;">
	<textarea name="fichier" rows="60" cols=30 style="overflow-y:scroll;resize:none;height:300px;">
		<?php
		if(file_exists('source/create.sql')){
			$lines = file('source/create.sql');
			foreach ($lines as $lineNumber => $lineContent){
				if(stristr($lineContent,"Create table ".$_GET['t'])){
					array_push($listeDebutCreate,$lineNumber);
					// echo $lineNumber,' ',$lineContent."";
				} elseif(stristr($lineContent,"Create table `".$_GET['t']."`")){
					array_push($listeDebutCreate,$lineNumber);
					// echo $lineNumber,' ',$lineContent."";
				}
					
				if(stristr($lineContent,") ENGINE=InnoDB DEFAULT CHARSET=latin1;")){
					array_push($listeFinCreate,$lineNumber);
					// echo $lineNumber,' ',$lineContent."";
				}
			}
			$debut = $listeDebutCreate[0];
			$fin = $listeFinCreate[0];
			for($pointeur = $debut+1;$pointeur < $fin;$pointeur++){
				echo $lines[$pointeur];
			}
		}
		?>
	</textarea>
	<textarea name="fichier" rows="60" cols=20 style="overflow-y:scroll;resize:none;height:300px;">
	<?php
	if(isset($_GET['o'])){
		switch($_GET['o']){
			case "e1":
				echo "<?php 
				class ".ucfirst($_GET['t'])." {";
				break;
			case "c":
				echo "public function C () {
					insert into ".$_GET['t']."(,,,) values (...)
				}";
				break;
			case "r":
				echo "public function R () {
					select * from ".$_GET['t']." where id = ?
				}";
				break;
			case "u":
				echo "public function U () {
					update ".$_GET['t']." set v1=?,... where id = ?
				}";
				break;
			case "d":
				echo "public function D () {
					delete from ".$_GET['t']." where id = ?
				}";
				break;
			case "l":
				echo "public function L () {
					select * from ".$_GET['t']."
				}";
				break;
			default:
				echo "<?php 
				class ".ucfirst($_GET['t'])." {";
				break;
		}
	} else {
		echo "<?php 
		class ".ucfirst($_GET['t'])." {";
	}
	?>
	</textarea>
</section>
<section style="position:fixed;top:48px;left:510px;">
	<form method="post" action="action/reg_alter.php?t=<?=$_GET['t'];?>">
		<textarea name="fichier" rows="300" cols=60 style="overflow-y:scroll;resize:none;
		height:500px;" wrap="hard">
		<?php
		if(file_exists($path)){
			$lines = file($path);
			foreach ($lines as $lineNumber => $lineContent){
				echo $lineNumber,' ',$lineContent."";
			}
		}
		?>
		</textarea>
		<input type="submit" value="Enregistrer">
	<form>
</section>
</body>
</html>