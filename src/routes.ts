import { Router } from 'express'
import { CreateVeiculosControllers } from './controllers/CreateVeiculosControllers'
import { CreateCompraControllers } from './controllers/CreateCompraControllers'

const router = Router()

const createVeiculos = new CreateVeiculosControllers()
const createCompra = new CreateCompraControllers()

router.post("/veiculos", createVeiculos.create)
router.get("/veiculos", createVeiculos.list)

router.post("/compra", createCompra.handle)

export {
    router
}