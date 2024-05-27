const funcionProducto = function (sequelize, dataTypes) {
    let alias = "Producto";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        usuarios_id: {
            type: dataTypes.INTEGRER
        },
        imagen_producto: {
            type: dataTypes.STRING
        },
        nombre_producto: {
            type: dataTypes.STRING
        },
        descripcion_producto: {
            type: dataTypes.STRING
        }

    };
    
    let config = {
        tableName: "comentarios",
        timestamps: false,
        underscored: true
    };

        /* definir un modelo */

    let Producto = sequelize.define(alias, cols, config);

    return Producto;
}

module.exports = funcionProducto