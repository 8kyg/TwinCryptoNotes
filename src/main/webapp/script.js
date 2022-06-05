
//var getId = window.location.search;
var getId = window.location.search.substring(window.location.search.indexOf('&')+1);
var jsPwd = window.location.hash.substring(window.location.hash.indexOf('#')+1);


console.log('getId= ' + getId );
console.log('javaPwd= '   + jsPwd);

//If you have ID and PWD then user wants encrypted message
if(getId && jsPwd){
    console.log('Yep. ID and PWD found');
    //Here need requesting message
    $.post ( "TwinCryptoNote", { read: true, id: getId } )
        .done(function ( data ){
            $('#text2crypt').val(JSON.parse(data).decrypted_data);
            console.log('rawData= '  + data);
        });
    //Here we decrypting message

    //here we posting decrypted message
}


// Encrypt ==> send and get new Id ==> make and show URL new twinEncryptionMessage
$('#btn-createlink').on('click', function(e){
    $.post ( "TwinCryptoNote", { data: $('#text2crypt').val() } )
        .done(function ( data ){
            let link = window.location.href;
            if(link.indexOf('?') > 0) link = link.substring(0,link.indexOf('?'));

            $('#text2crypt').val(link + '?read&' + JSON.parse(data).newid + '#test');

    });
});
//<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
var message = "café";
var key = "something";

var encrypted = CryptoJS.AES.encrypt(message, key);
//equivalent to CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(message), key);
var decrypted = CryptoJS.AES.decrypt(encrypted, key);

$('#1').text("Encrypted: "+encrypted);
$('#2').text("Decrypted: "+decrypted.toString(CryptoJS.enc.Utf8));

console.log(encrypted.toString());
console.log(decrypted.toString(CryptoJS.enc.Utf8));

