
function test(val) {
    
    const jsonObj = JSON.parse(val);
    
    var h1 = document.getElementById("title");
    h1.textContent = jsonObj.title;
    
    webkit.messageHandlers.callbackHandler.postMessage(val);
}

