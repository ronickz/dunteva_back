const { Sequelize } = require("sequelize");


try {
  const conexion = new Sequelize(process.env.DATABASE, process.env.USER, "", {
    host: process.env.HOST,
    dialect: "mysql",
  });
  
} catch (error) {
    console.log('Error en la base de datos',error.message)
}




module.exports = conexion;
