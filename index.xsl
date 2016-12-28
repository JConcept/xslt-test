<?xml version="1.0" encoding="utf-8"?>
<!-- On déclare les entités ici. Pour en ajouter (https://www.w3.org/TR/REC-html40/sgml/entities.html), le faire à la suite de celles-ci : -->
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
    <!ENTITY copy   "&#169;">
    <!ENTITY reg    "&#174;">
    <!ENTITY trade  "&#8482;">
    <!ENTITY mdash  "&#8212;">
    <!ENTITY ldquo  "&#8220;">
    <!ENTITY rdquo  "&#8221;">
    <!ENTITY pound  "&#163;">
    <!ENTITY yen    "&#165;">
    <!ENTITY euro   "&#8364;">
]>

<!-- Déclaration pour le code XSLT -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />
    <xsl:template match="/">
        <!-- https://openclassrooms.com/courses/les-bases-de-la-mise-en-forme-xml-avec-xslt#/id/r-1213330 :
            La première ligne renseigne la version de XSLT et désigne le namespace (xmlns:xsl) des balises XSLT, c'est-à-dire leur « préfixe ». La valeur par défaut est xsl, et je la conserverai tout au long du tutoriel.
            La deuxième ligne donne des informations sur le format de la page après transformation. Dans le cas où vous en utilisez un autre, changez l'encodage.
            La troisième ligne indique quelles balises seront concernées par le code qui s'y trouve. Vous pouvez en mettre plusieurs, comme une qui ne concernerait qu'un type d'élément si le fichier XML contenait plus d'un type de données. 
        -->

        <!-- Déclaration de votre code HTML :
            Vous pouvez utiliser tout code qu'une page HTML peut gérer (balises HTML classiques, CSS et même JavaScript).
            /!\ ATTENTION /!\ : il est impossible d'exploiter du contenu dynamique avec PHP, ici directment, mais vous pouvez l'inclure via php.
        -->
        <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>Mise en forme avec XSLT</title>
        </head>
        <body>
            <h1>Utilisation du XML/XSLT &amp; HTML</h1>

            <h2>Canvas de base en XSLT</h2>
            <table width="1000" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Type</th>
                    <th scope="col">Prix</th>
                </tr>
                <tr> <!-- On va utiliser Xpath pour naviguer dans les données XML : https://openclassrooms.com/courses/structurez-vos-donnees-avec-xml/xpath-localiser-les-donnees --> 
                    <td><xsl:value-of select="test/jeu/@id"/></td>
                    <td><xsl:value-of select="test/jeu/nom"/></td>
                    <td><xsl:value-of select="test/jeu/type"/></td>
                    <td><xsl:value-of select="test/jeu/prix"/></td>
                </tr>
            </table>

            <h2>Utilisation de boucles</h2>
            <table width="1000" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Type</th>
                    <th scope="col">Prix</th>
                </tr>
                <!-- Les crochets [] servent de filtre -->
                <xsl:for-each select="test/jeu[type= 'Jeu de plate-forme']">
                    <tr>
                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="nom"/></td>
                        <td><xsl:value-of select="type"/></td>
                        <td><xsl:value-of select="prix"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Utilisation des opérateurs de comparaison + AND/OR</h2>
            <table width="1000" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Type</th>
                    <th scope="col">Prix</th>
                </tr>
                <!-- 
                    on peut utiliser tous les opérateurs de comparaisons que l'on veut 
                    on peut aussi utiliser AND/OR
                    /!\ ON NE PEUT PAS UTILISER LES DEUX !
                -->
                <xsl:for-each select="test/jeu[@id != 4 and @id >= 2]">
                    <tr>
                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="nom"/></td>
                        <td><xsl:value-of select="type"/></td>
                        <td><xsl:value-of select="prix"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <h2>Utilisation des conditions</h2>
            <h3>Le if</h3>
            <h4>Si j'ai Mario Sokoban</h4>
            <table width="1000" border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Type</th>
                    <th scope="col">Prix</th>
                </tr>
                <!-- 
                    on peut utiliser tous les opérateurs de comparaisons que l'on veut 
                    on peut aussi utiliser AND/OR
                    /!\ ON NE PEUT PAS UTILISER LES DEUX !
                -->
                <xsl:for-each select="test/jeu[nom = 'Mario Sokoban']">
                    <xsl:if test="nom = 'Mario Sokoban'">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="nom"/></td>
                            <td><xsl:value-of select="type"/></td>
                            <td><xsl:value-of select="prix"/></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
            <h4>Si j'ai Metroid Prime</h4>
            <xsl:if test="test/jeu[nom = 'Metroid Prime']">
                <table width="1000" border="1" cellspacing="0" cellpadding="0">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nom</th>
                        <th scope="col">Type</th>
                        <th scope="col">Prix</th>
                    </tr>
                    <!-- 
                        on peut utiliser tous les opérateurs de comparaisons que l'on veut 
                        on peut aussi utiliser AND/OR
                        /!\ ON NE PEUT PAS UTILISER LES DEUX !
                    -->
                        <xsl:for-each select="test/jeu[nom = 'Metroid Prime']">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="nom"/></td>
                                <td><xsl:value-of select="type"/></td>
                                <td><xsl:value-of select="prix"/></td>
                            </tr>
                        </xsl:for-each>
                </table>
            </xsl:if>
            <h4>Sinon</h4><!-- @beug si Metroid Prime existe, il affiche qu'il n'existe pas -->
            <xsl:if test="test/jeu[nom != 'Metroid Prime']">
                <p><b>Metroid Prime</b> n'existe pas.</p>
            </xsl:if>                               

            <h3>Le "switch"</h3>

        </body>
        </html>

        <!-- Fermeture des balises XSLT -->
    </xsl:template>
</xsl:stylesheet>