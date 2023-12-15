document.getElementById("generatePassword").addEventListener("click", function() {
    const passwordLength = document.getElementById("passwordLength").value;
    const includeUppercase = document.getElementById("includeUppercase").checked;
    const includeLowercase = document.getElementById("includeLowercase").checked;
    const includeNumbers = document.getElementById("includeNumbers").checked;
    const includeSpecialChars = document.getElementById("includeSpecialChars").checked;

    const uppercaseChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lowercaseChars = 'abcdefghijklmnopqrstuvwxyz';
    const numberChars = '0123456789';
    const specialChars = '!@#$%^&*()_+[]{}|;:,.<>?';

    let allowedChars = '';

    if (includeUppercase) {
        allowedChars += uppercaseChars;
    }
    if (includeLowercase) {
        allowedChars += lowercaseChars;
    }
    if (includeNumbers) {
        allowedChars += numberChars;
    }
    if (includeSpecialChars) {
        allowedChars += specialChars;
    }

    let newPassword = '';
    for (let i = 0; i < passwordLength; i++) {
        const randomIndex = Math.floor(Math.random() * allowedChars.length);
        newPassword += allowedChars.charAt(randomIndex);
    }

    document.getElementById("passwordResult").textContent = newPassword;
});