<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Vikerfjell</title>
<link href="styles/main.css" rel="stylesheet" type="text/css">
<!-- Google Fonts Roboto, alle typer -->
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<!--  -->
<script type="text/javascript" src="functions/funksjoner.js"></script>
<!--  -->    
</head>
<body>
<!-- her lager jeg en ny nav "joacim bergh" -->
<header>
<aside id="mytopnav">
    <div id="mySidenav" class="sidenav" >
        <a href="sverige.php">Sverige</a>
        <a href="danmark.php">Danmark</a>
        <a href="island.php">Island</a>
        <a href="japan.php">japan</a>
        <a href="kina.php">Kina</a>
        <a href="mexico.php">Mexico</a>
        <a href="usa.php">USA</a>
        <a href="australia.php">Australia</a>
        <a href="thailand.php">Thailand</a>
        <a href="marokko.php">Marokko</a>
    </div>
</aside>
</header>


<div class="grid1 topp">
    <div class="row side">
        <div class="col-sm-6">
            <div class="col4 hytter">
                <img src="images/norge.png" alt="" width="600px;" height="600px;">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="col4 hytter">
<?php

$xmlFiles = [
    'innbyggertall.xml',
    'kursliste.xml'
  ];
  
  $targetDom = new DOMDocument();
  $xslt = new XSLTProcessor();
  
  $XSL = new DOMDocument();
  $XSL->load( 'norge.xsl' );
  $xslt->importStylesheet($XSL);

  $rootNode = $targetDom->appendChild(
    $targetDom->createElement('root')
  );
  
  foreach ($xmlFiles as $xmlFile) {
    $importDom = new DOMDocument();
    $importDom->load($xmlFile);
    foreach ($importDom->documentElement->childNodes as $node) {
      $rootNode->appendChild($targetDom->importNode($node, TRUE));
    }
  }
  
  $targetDom->save("merged.xml");
  print $xslt->transformToXML($targetDom);
  
?> 
            </div>
        </div>
    </div>
</div>
</body>
</html>