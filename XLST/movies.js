function loadXMLDoc(filename) {
  if (window.ActiveXObject) {
    xhttp = new ActiveXObject("Msxml2.XMLHTTP");
  }
  else {
    xhttp = new XMLHttpRequest();
  }
  xhttp.open("GET", filename, false);
  xhttp.setRequestHeader('Access-Control-Allow-Headers', '*');
  xhttp.setRequestHeader('Access-Control-Allow-Origin', '*');
  xhttp.setRequestHeader("Content-Type", "application/json");
  xhttp.setRequestHeader('Allow-File-Access-From-', '*');
  xhttp.send();
  return xhttp.responseXML;
}



function displayAlphabets() {
  //xml = loadXMLDoc("movies.xml");
  //console.log(xml);
  xsl = loadXMLDoc("alphabets.xsl");
  console.log(xsl);
  abcxml = loadXMLDoc("abcd.xml");
  console.log(abcxml);
  // code for IE
  if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
    ex = xml.transformNode(xsl);
    document.getElementById("alphabets").innerHTML = ex;
  }
  // code for Chrome, Firefox, Opera, etc.
  else if (document.implementation && document.implementation.createDocument) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    //resultDocument = xsltProcessor.transformToFragment(xml, document);
    //console.log("Result");
    //console.log(resultDocument);
    alpharesultDocument = xsltProcessor.transformToFragment(abcxml, document);
    console.log(alpharesultDocument);
    //document.getElementById("movieData").appendChild(resultDocument);
    document.getElementById("alphabets").appendChild(alpharesultDocument);
  }
}




function displayMovies(firstLetter) {
  xml = loadXMLDoc("movies.xml");
  //console.log(xml);
  xsl = loadXMLDoc("movies.xsl");
  console.log(xsl);
  //abcxml = loadXMLDoc("abcd.xml");
  //console.log(abcxml);
  // code for IE
  if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
    ex = xml.transformNode(xsl);
    document.getElementById("movieData").innerHTML = ex;
  }
  // code for Chrome, Firefox, Opera, etc.
  else if (document.implementation && document.implementation.createDocument) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    xsltProcessor.setParameter(null, "firstLetter", firstLetter);
    resultDocument = xsltProcessor.transformToFragment(xml, document);
    //console.log("Result");
    console.log(resultDocument);
    //alpharesultDocument = xsltProcessor.transformToFragment(abcxml, document);
    //console.log(alpharesultDocument);
    //document.getElementById("movieData").appendChild(resultDocument);
    e = document.getElementById("movieData")
    f = document.getElementById("movieInfo")
    while (e.hasChildNodes()) {
      console.log("Hello");
      e.removeChild(e.firstChild);
      if (f.firstChild) {
        f.removeChild(f.firstChild);
      }
    }
    e = document.getElementById("movieData")
    f = document.getElementById("movieInfo")
    while (e.hasChildNodes()) {
      e.removeChild(e.firstChild);
      f.removeChild(f.firstChild);
    }
    e.appendChild(resultDocument);
    //document.getElementById("alphabets").appendChild(alpharesultDocument);
  }
}



function displayInfo(movieName) {
  xml = loadXMLDoc("movies.xml");
  console.log(xml);
  xsl = loadXMLDoc("movieInfo.xsl");
  console.log(xsl);
  // code for IE
  if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
    ex = xml.transformNode(xsl);
    document.getElementById("movieInfo").innerHTML = ex;
  }
  // code for Chrome, Firefox, Opera, etc.
  else if (document.implementation && document.implementation.createDocument) {
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    xsltProcessor.setParameter(null, "movieName", movieName);
    resultDocument = xsltProcessor.transformToFragment(xml, document);
    console.log(resultDocument);
    e = document.getElementById("movieInfo")
    while (e.hasChildNodes()) {
      e.removeChild(e.firstChild);
    }
    e = document.getElementById("movieInfo")
    while (e.hasChildNodes()) {
      e.removeChild(e.firstChild);
    }
    e.appendChild(resultDocument);
  }
}


