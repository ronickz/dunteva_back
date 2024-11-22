const { DataTypes } = require("sequelize");
const inicializarBDD = require("../database/database");


const Objeto = async () => {

    const sequelize = await inicializarBDD();

    const Categoria = sequelize.define("Categoria", {
      Id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      Nombre: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      Descripcion: {
        type: DataTypes.STRING(100),
        allowNull: true,
      },
    },{
        tableName: 'Categorias',
        timestamps: false
    });

    module.exports = Categoria
    
}




