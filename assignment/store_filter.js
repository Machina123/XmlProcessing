function getDocument(callback) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4) {
            callback(this);
        }
    };
    xhttp.open("GET", "store.xml", true);
    xhttp.send();
}

function showFileContents() {
    var resultDomElem = document.getElementById("show-all");
    getDocument(function(xhr) {
        var xml = xhr.responseXML;
        var path = "//phone";
        var nodes = xml.evaluate(path, xml, null, XPathResult.ANY_TYPE, null);
        resultDomElem.innerHTML = "";
        while(result = nodes.iterateNext()) {
            resultDomElem.innerHTML += "phone/@type = " + result.getAttribute("type") + "<br>";
            // console.log(result);
            console.log(result.childNodes.length);
            for(var i = 0; i < result.childNodes.length; i++) {
                child = result.childNodes[i];
                console.log(typeof(child))
            }
        }
    })
}

function documentReady() {
    var showAllButtonDomElem = document.getElementById("btnshowall");

    showAllButtonDomElem.addEventListener("click", showFileContents, false);
}

window.addEventListener("load", documentReady, false);