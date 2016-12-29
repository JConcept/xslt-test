# Utilisation dynamique du language XSLT via PHP

Pour visualiser le résultat : http://jconcept.be/test-php-xml-xslt/   
[Pour voir le code php](./index.php)

J'ai fait en sorte de trier de façon dynamique les id de résultat.   
Le code ci-dessous, je l'ai donc créé dans une fonction :

``` PHP
<?php
   $xslDoc = new DOMDocument();
   $xslDoc->load("sommaire.xsl");

   $xmlDoc = new DOMDocument();
   $xmlDoc->load("chapitre.xml");

   $proc = new XSLTProcessor();
   $proc->importStylesheet($xslDoc);
   echo $proc->transformToXML($xmlDoc);
?>
```

Pour aller plus loin, j'ai découvert ce cours traitant aussi sur les autres fonctions du XSLT _(dont sort que j'ai utilisé pour trier les résultats)_ : https://openclassrooms.com/courses/structurez-vos-donnees-avec-xml/les-templates-7#/id/r-1772814