
function verificarInventario() {
    console.log("Verificando el inventario...");

    var inventario = [
        {
            nombre: "Producto 1",
            precio: 100,
            stock: 1200
        },
        {
            nombre: "Producto 2",
            precio: 150,
            stock: 800
        },
        {
            nombre: "Producto 3",
            precio: 200,
            stock: 1500
        },
        {
            nombre: "Producto 4",
            precio: 190,
            stock: 500
        },
        {
            nombre: "Producto 5",
            precio: 600,
            stock: 2500
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
