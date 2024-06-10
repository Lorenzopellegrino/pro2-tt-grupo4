const funcionProducto = function (sequelize, dataTypes) {
    let alias = "Producto";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        usuariosId: {
            type: dataTypes.INTEGER
        },
        imagenProducto: {
            type: dataTypes.STRING
        },
        nombreProducto: {
            type: dataTypes.STRING
        },
        descripcionProducto: {
            type: dataTypes.STRING
        },
        createdAt: {
            type: dataTypes.DATE
        },
        updatedAt: {
            type: dataTypes.DATE
        },
        deletedAt: {
            type: dataTypes.DATE
        }

    };
    
    let config = {
        tableName: "productos",
        timestamps: true,
        underscored: false
    };

        /* definir un modelo */

    let Producto = sequelize.define(alias, cols, config);

    Producto.associate = function(models) {

        Producto.belongsTo (models.Usuario , {
            as: "usuario",
            foreignKey : "usuariosId"
        });

        Producto.hasMany(models.Comentario, {
            as: "comentarios" ,
            foreignKey: "productoId"
        });
    }

    return Producto;
}

module.exports = funcionProducto