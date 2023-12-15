let pedido = [];

function Entero(valor) {
    return Number.isInteger(valor);
}

function EnteroPositivo(valor) {
    return Entero(valor) && valor > 0;
}

function SoloDigitos(valor) {
    const patron = /^[0-9]+$/;
    return patron.test(valor);
}



function agregarAlPedido() {
    const menuOption = document.getElementById("menuOption");
    const cantidad = document.getElementById("cantidad");
    const valorCantidad = parseInt(cantidad.value);

    if (menuOption.value === "0") {
        alert("Por favor, seleccione un plato válido.");
        return; // Detiene la ejecución si no se ha seleccionado un plato válido
    }

    if (valorCantidad === 0) {
        alert("Por favor agregue a su pedido una cantidad mayor a 0.");
        return; // Detiene la ejecución si la cantidad es 0
    }

    if (
        menuOption.value !== "0" &&
        EnteroPositivo(valorCantidad) &&
        SoloDigitos(cantidad.value)
    ) {
        const nombreOpcion = menuOption.options[menuOption.selectedIndex].text;
        const precioOpcion = parseFloat(menuOption.value);
        const totalItem = precioOpcion * valorCantidad;

        pedido.push({ nombre: nombreOpcion, total: totalItem });

        const listaPedido = document.getElementById("listaPedido");
        const elementoLista = document.createElement("li");
        elementoLista.textContent = `${valorCantidad} x ${nombreOpcion} = $${totalItem}`;
        listaPedido.appendChild(elementoLista);
    } else {
        alert("Solo se admiten valores enteros positivos y sin caracteres especiales.");
    }
}

function calcularTotal() {
    let subtotal = 0;
    for (let item of pedido) {
        subtotal += item.total;
    }
    const iva = subtotal * 0.19;
    const total = subtotal + iva;

    document.getElementById("subtotal").textContent = subtotal.toFixed(2);
    document.getElementById("iva").textContent = iva.toFixed(2);
    document.getElementById("total").textContent = total.toFixed(2);
}
