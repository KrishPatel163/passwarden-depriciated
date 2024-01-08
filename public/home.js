function decryptAndCopy(encryptedPassword) {
    var key = CryptoJS.enc.Hex.parse('def00000c123cf86290d9e124ce4d6ec9ff24650c28742763052c8ca6e98084bb86669766f633eb109b45b1ba5e9c0d99ccb5fac8940f0ded0ea937a283f688d83c48ac1'); // Replace with your actual secret key in hexadecimal format
    var iv = CryptoJS.enc.Hex.parse('0587af72554b4281'); // Replace with your actual IV in hexadecimal format

    try {
        var decrypted = CryptoJS.AES.decrypt(
            encryptedPassword,
            key,
            { iv: iv, mode: CryptoJS.mode.CBC, padding: CryptoJS.pad.Pkcs7 }
        ).toString(CryptoJS.enc.Utf8);

        if (decrypted) {
            navigator.clipboard.writeText(decrypted)
                .then(() => {
                    alert("Password copied to clipboard");
                })
                .catch((err) => {
                    console.error("Error copying password to clipboard: ", err);
                });
        } else {
            console.error("Decryption failed or resulted in empty value.");
        }
    } catch (error) {
        console.error("Decryption error:", error);
    }
}
