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
            resultDomElem.innerHTML += "Type: " + result.getAttribute("type") + "<br>";
            for(var i = 0; i < result.childNodes.length; i++) {
                child = result.childNodes[i];
                if(child.nodeType == 3) continue;
                resultDomElem.innerHTML += child.nodeName + ": " + child.childNodes[0].nodeValue;
                if(child.hasAttributes()) {
                    for(var j=0; j<child.attributes.length; j++) {
                        resultDomElem.innerHTML += "<em> (" + child.attributes[j].name + ": " + child.attributes[j].value + ")</em>";
                    }
                }
                resultDomElem.innerHTML += "<br>"
            }
            resultDomElem.innerHTML += "<hr>";
        }
    })
}

function showSortedFileContents(event) {
    var resultDomElem = document.getElementById("show-all");
    var type=event.srcElement.getAttribute("data-type");
    getDocument(function(xhr) {
        var xml = xhr.responseXML;
        var path = "//phone[@type='"+type + "']";
        var nodes = xml.evaluate(path, xml, null, XPathResult.ANY_TYPE, null);
        resultDomElem.innerHTML = "";
        while(result = nodes.iterateNext()) {
            resultDomElem.innerHTML += "Type: " + result.getAttribute("type") + "<br>";
            for(var i = 0; i < result.childNodes.length; i++) {
                child = result.childNodes[i];
                if(child.nodeType == 3) continue;
                resultDomElem.innerHTML += child.nodeName + ": " + child.childNodes[0].nodeValue;
                if(child.hasAttributes()) {
                    for(var j=0; j<child.attributes.length; j++) {
                        resultDomElem.innerHTML += "<em> (" + child.attributes[j].name + ": " + child.attributes[j].value + ")</em>";
                    }
                }
                resultDomElem.innerHTML += "<br>"
            }
            resultDomElem.innerHTML += "<hr>";
        }
    })
}

function showSelectedNode() {
    var resultDomElem = document.getElementById("show-all");
    var nodename=document.getElementById("node").value;
    getDocument(function(xhr) {
        var xml = xhr.responseXML;
        var path = "//" + nodename;
        var nodes = xml.evaluate(path, xml, null, XPathResult.ANY_TYPE, null);
        resultDomElem.innerHTML = "";
        while(result = nodes.iterateNext()) {
            resultDomElem.innerHTML += result.nodeName + ": " + result.childNodes[0].nodeValue;
            if(result.hasAttributes()) {
                for(var j=0; j<result.attributes.length; j++) {
                    resultDomElem.innerHTML += "<em> (" + result.attributes[j].name + ": " + result.attributes[j].value + ")</em>";
                }
            }
            resultDomElem.innerHTML += "<br>"
            resultDomElem.innerHTML += "<hr>";
        }
    })
}

function documentReady() {
    var showAllButtonDomElem = document.getElementById("btnshowall");
    showAllButtonDomElem.addEventListener("click", showFileContents, false);

    var showSortedButtons = document.querySelectorAll(".show-sorted");
    showSortedButtons.forEach(function(elem, key, parent){
        elem.addEventListener("click", showSortedFileContents, false);
    });

    var showSelectedNodeButton = document.getElementById("shownode");
    showSelectedNodeButton.addEventListener("click", showSelectedNode, false);
}

window.addEventListener("load", documentReady, false);