const { Router } = require('express');

const { obtenerTodosLosProductos } = require('../controller/productos');


const router = Router();

router.get('/',obtenerTodosLosProductos);
router.post('/');
router.put('/');
router.delete('/');


module.exports = router;