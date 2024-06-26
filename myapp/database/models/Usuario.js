const funcionUsuario = function (sequelize, dataTypes) {
    let alias = "Usuario";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        mail: {
            type: dataTypes.STRING
        },
        usuario: {
            type: dataTypes.STRING
        },
        contrasenia: {
            type: dataTypes.STRING
        },
        fecha: {
            type: dataTypes.DATE
        },
        dni: {
            type: dataTypes.INTEGER
        },
        fotoperfil: {
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
        tableName: "usuarios",
        timestamps: true,
        underscored: false
    };

        /* definir un modelo */

    let Usuario = sequelize.define(alias, cols, config);

    Usuario.associate = function(models) {

        Usuario.hasMany(models.Comentario , {
            as: "comentarios",
            foreignKey : "usuarioId"
        });

        Usuario.hasMany(models.Producto, {
            as: "productos" ,
            foreignKey: "usuarioId"
        });
    }

    return Usuario;
}

module.exports = funcionUsuario