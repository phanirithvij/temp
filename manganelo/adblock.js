// ==UserScript==
// @name         Manganelo Adblocker
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       Phani Rithvij
// @match        http://manganelo.com/*
// @include      http://manganelo.com/*
// @include      http://manganelo.com/*/*
// @run-at       document-end
// @grant        GM_deleteValue
// @grant        GM_setValue
// @grant        GM_xmlhttpRequest
// ==/UserScript==
window.addEventListener('load', function() {
(function() {
    'use strict';
     function removeElementsByClass(className){
    var elements = document.getElementsByClassName(className);
    while(elements.length > 0){
        elements[0].parentNode.removeChild(elements[0]);
    }
}
    removeElementsByClass("mgbox");
})();
}, false);
