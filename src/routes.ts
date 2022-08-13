import { Router } from 'express'
import { CreateVeiculosControllers } from './controllers/CreateVeiculosControllers'
import { CreateCompraControllers } from './controllers/CreateCompraControllers'
import { CreateVendaControllers } from './controllers/CreateVendaControllers'

const router = Router()

const createVeiculos = new CreateVeiculosControllers()
const createCompra = new CreateCompraControllers()
const createVenda = new CreateVendaControllers()

router.post("/veiculos", createVeiculos.create)
router.get("/veiculos", createVeiculos.list)
router.delete("/veiculos/:id", createVeiculos.delete)

router.post("/compra", createCompra.handle)
router.get("/compra", createCompra.list)

router.post("/venda", createVenda.handle)
router.get("/venda", createVenda.list)

export {
    router
}