import { Request, Response } from 'express'
import { prismaClient } from '../database/prismaClient'

export class CreateCompraControllers {
  async handle(request: Request, response: Response) {
    const { id_veiculos, valor_compra } = request.body
    const compra = await prismaClient.compra.create({
      data: {
        valor_compra,
        id_veiculos
      }
    })
    return response.json(compra)
  }

  async list(request: Request, response: Response) {
    const compra = await prismaClient.compra.findMany({
      orderBy: {
        data_compra: "desc"
      }
    })
    return response.json(compra)
  }
}