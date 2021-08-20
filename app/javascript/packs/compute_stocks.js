window.onload = function(){

    var transaction_share = document.getElementById("transaction_share");
    var xLoad = parseInt(document.getElementById("price").value);
    var yLoad = parseInt(document.getElementById("transaction_share").value);

    document.getElementById("transaction_value").value = xLoad * yLoad;

    transaction_share.addEventListener("keyup", function(e) {
        var x = parseInt(document.getElementById("price").value);
        var y = parseInt(document.getElementById("transaction_share").value);
        document.getElementById("transaction_value").value = x * y;
        
    });
}
