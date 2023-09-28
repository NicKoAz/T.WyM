var inventario = [
    {
        nombre: "Producto 1",
        precio: 10,
        stock: 1200
    },
    {
        nombre: "Producto 2",
        precio: 15,
        stock: 800
    },
    {
        nombre: "Producto 3",
        precio: 20,
        stock: 1500
    }
];

function verificarInventario() {
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
