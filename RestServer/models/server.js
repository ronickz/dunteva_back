const inicializarBDD = require("../database/database");
const express = require('express');
const cors = require('cors')


class Server {
    constructor(){
        this.app = express()
        this.port = process.env.PORT
        this.conexion;


        //Endpoints
        this.paths = {
            productos: '/api/productos'
        }
        this.routes()


        //Middlewares

        this.middlewares()


        //BDD
        this.conexionBDD();
    }

    middlewares(){
        this.app.use(cors())
        this.app.use(express.json())
    }

    routes(){
        this.app.use(this.paths.productos,require('../routes/productos'))
    }

    async conexionBDD(){
        await inicializarBDD();
    }

    listen(){
        this.app.listen(this.port,()=>{
            console.log(`Servidor corriendo en puerto ${this.port}`)
        })
    }
}

module.exports = Server