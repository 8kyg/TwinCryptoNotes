const characters ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
const keyLenght = 14;


function randomString(length) {
    let result = '';
    let charactersLength = characters.length;
    for ( let i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }

    return result;
}

//console.log(randomString(50));

/*
var message = "café123123123";
var key = "something";

var encrypted = CryptoJS.AES.encrypt(message, key);
//equivalent to CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(message), key);
var decrypted = CryptoJS.AES.decrypt(encrypted, key);

$('#1').text("Encrypted: "+encrypted);
$('#2').text("Decrypted: "+decrypted.toString(CryptoJS.enc.Utf8));

console.log(encrypted.toString());
console.log(decrypted.toString(CryptoJS.enc.Utf8));
*/

//var getId = window.location.search;
var getId = window.location.search.substring(window.location.search.indexOf('&')+1);
var jsPwd = window.location.hash.substring(window.location.hash.indexOf('#')+1);


console.log('getId=' + getId );
console.log('javaPwd='   + jsPwd);

//If you have ID and PWD then user wants encrypted message
if(getId && jsPwd){
    console.log('Yep. ID and PWD found');
    //Here need requesting message
    $.post ( "TwinCryptoNote", { read: true, id: getId } )
        .done(function ( data ){
//            $('#text2crypt').val(CryptoJS.AES.decrypt.toString(JSON.parse(data).decrypted_data, jsPwd));
            let getData = JSON.parse(data).decrypted_data;
            console.log('rawData= ' + getData );
            getData = CryptoJS.AES.decrypt(getData, jsPwd);
            console.log('decryptedData= '  + getData.toString(CryptoJS.enc.Utf8));
            $('#text2crypt').val(getData.toString(CryptoJS.enc.Utf8));
        });
    //Here we decrypting message

    //here we posting decrypted message
}


// Encrypt ==> send and get new Id ==> make and show URL new twinEncryptionMessage
$('#btn-createlink').on('click', function(e){
    let newKey, encryptedData, dataToEncrypt;

    dataToEncrypt = $('#text2crypt').val();
    newKey = randomString(keyLenght);
    console.log('new_key=' + newKey);
    encryptedData =  CryptoJS.AES.encrypt( dataToEncrypt , newKey);

    $.post ( "TwinCryptoNote", { data: encryptedData.toString() } )
        .done(function ( data ){
            let link = window.location.href;
            if(link.indexOf('?') > 0) link = link.substring(0,link.indexOf('?'));

            $('#text2crypt').val(link + '?read&' + JSON.parse(data).newid + '#' + newKey);

    });
});



