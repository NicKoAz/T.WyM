
function verificarInventario() {
    console.log("Verificando el inventario...");

    var inventario = [
        {
            nombre: "Producto A",
            precio: 10,
            stock: 1200
        },
        {
            nombre: "Producto B",
            precio: 15,
            stock: 800
        },
        {
            nombre: "Producto C",
            precio: 20,
            stock: 1500
        }
    ];

    var stockCritico = false;

    for (var i = 0; i < inventario.length; i++) {
        if (inventario[i].stock < 1000) {
            console.log("Producto con stock crítico:", inventario[i].nombre);
            stockCritico = true;
        }
    }

    if (stockCritico) {
        console.log("El inventario tiene productos con stock crítico.");
    } else {
        console.log("El inventario está en buen estado.");
    }
}

verificarInventario();
