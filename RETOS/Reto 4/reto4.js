// Mover la función de inicio aquí
function initialize() {
    // Puedes realizar alguna inicialización si es necesario
}

function calculateIMC() {
    var name = document.getElementById('name').value;
    var weight = parseFloat(document.getElementById('weight').value);
    var height = parseFloat(document.getElementById('height').value);
    var age = parseInt(document.getElementById('age').value);
    var gender = document.getElementById('gender').value;
    var activityLevel = document.getElementById('activityLevel').value;

    var bmi = weight / Math.pow(height, 2);
    var classification = getBMIClassification(bmi);
    var ged = calculateGED(weight, activityLevel);
    var nutritionalStatus = getNutritionalStatus(bmi);

    var resultMessage = `
        Nombre: ${name}<br>
        IMC: ${bmi.toFixed(2)} (${classification})<br>
        GED: ${ged.toFixed(2)} kcal/día<br>
        Estado Nutricional: ${nutritionalStatus}
    `;

    document.getElementById('result').innerHTML = resultMessage;
}

function getBMIClassification(bmi) {
    if (bmi < 18.5) {
        return 'Bajo peso';
    } else if (bmi >= 18.5 && bmi < 25) {
        return 'Peso normal';
    } else if (bmi >= 25 && bmi < 30) {
        return 'Sobrepeso';
    } else {
        return 'Obesidad';
    }
}

function calculateGED(weight, activityLevel) {
    var activityFactors = {
        sedentary: 1.2,
        moderate: 1.55,
        active: 1.9
    };

    return weight * activityFactors[activityLevel];
}

function getNutritionalStatus(bmi) {
    if (bmi < 18.5) {
        return 'Necesita atención especializada (bajo peso)';
    } else if (bmi >= 18.5 && bmi < 25) {
        return 'Estado nutricional adecuado';
    } else if (bmi >= 25 && bmi < 30) {
        return 'Necesita atención especializada (sobrepeso)';
    } else {
        return 'Necesita atención especializada (obesidad)';
    }
}
