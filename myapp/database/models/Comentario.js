const funcionComentario = function (sequelize, dataTypes) {
    let alias = "Comentario";

    let cols = {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        producto_id: {
            type: dataTypes.INTEGRER
        },
        usuario_id: {
            type: dataTypes.INTEGRER
        },
        comentario: {
            type: dataTypes.STRING
        }
    };
    
    let config = {
        tableName: "comentarios",
        timestamps: false,
        underscored: true
    };

        /* definir un modelo */

    let Comentario = sequelize.define(alias, cols, config);

    return Comentario;
}

module.exports = funcionComentario