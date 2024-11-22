const {request,response} = require ('express')
const Categoria = require('../models/categoria')




const obtenerTodosLosProductos = async (req=request,res=response) => {

    try {
        console.log(Categoria)
        const categorias = await Categoria.findAll();
        res.json({
            categorias
        })
    } catch (error) {
        
    }

}




module.exports = {
    obtenerTodosLosProductos
}