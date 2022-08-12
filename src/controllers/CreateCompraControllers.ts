import { Request, Response } from 'express'
import { prismaClient } from '../database/prismaClient'

export class CreateCompraControllers {
  async handle(request: Request, response: Response) {
    const { id_veiculos, valor_compra, data_compra } = request.body

    const compra = await prismaClient.compra.create({
      data: {
        valor_compra,
        data_compra,
        id_veiculos
      }
    })

    return response.json(compra)
  }
}