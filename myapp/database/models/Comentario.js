const funcionComentario = function (sequelize, dataTypes) {
    let alias = "Comentario";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        productoId: {
            type: dataTypes.INTEGER
        },
        usuariosId: {
            type: dataTypes.INTEGER
        },
        comentario: {
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
        tableName: "comentarios",
        timestamps: true,
        underscored: false
    };

        /* definir un modelo */

    let Comentario = sequelize.define(alias, cols, config);

    return Comentario;
}

module.exports = funcionComentario