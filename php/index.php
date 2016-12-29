<?php
    $fInsertXML = function($xslPath, $xmlPath){
        $xslDoc = new DOMDocument();
        $xslDoc->load($xslPath . ".xsl");

        $xmlDoc = new DOMDocument();
        $xmlDoc->load($xmlPath . ".xml");

        $proc = new XSLTProcessor();
        $proc->importStylesheet($xslDoc);
        echo $proc->transformToXML($xmlDoc);
    };
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Test de page php avec insertion de XML</title>
</head>
<body>
    <h1>Test de page php avec insertion de XML</h1>
    <p>Nous allons utiliser php pour insérer notre page XML mise en forme avec XSLT</p>

    <h2>Nous allons faire simple avec une première insertion classique</h2>
    <?php $fInsertXML ("1", "index"); ?>
        
    <h2>Ici, vous pouvez changer <span style="color:red;">dynamiquement</span> le résultat souhaité</h2>
    <?php 
        if ($_GET) {
            $fInsertXML ($_GET['changeXML'], "index");
        }
        else {
            $fInsertXML ("1", "index");
        }
    ?>
    <form action="" method="get">
        <label for="selectOther">Choisissez :</label><br>        
        <?php 
            if (!$_GET || $_GET['changeXML'] == 1) {
            ?>
                <input type="radio" value="1" name="changeXML" checked="checked">Classer du plus petit au plus grand</input><br>
                <input type="radio" value="2" name="changeXML" id="selectOther">Classer du plus grand au plus petit</input><br>
            <?php
            }
            else {
            ?>
                <input type="radio" value="1" name="changeXML" id="selectOther">Classer du plus petit au plus grand</input><br>
                <input type="radio" value="2" name="changeXML" checked="checked">Classer du plus grand au plus petit</input><br>
            <?php
            }
        ?>
        <input type="submit">
    </form>     
</body>
</html>