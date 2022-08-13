import { Request, Response } from 'express'
import { prismaClient } from '../database/prismaClient'

export class CreateVendaControllers {
  async handle(request: Request, response: Response) {
    const { id_veiculos, valor_venda, data_venda } = request.body
    const venda = await prismaClient.venda.create({
      data: {
        valor_venda,
        data_venda,
        id_veiculos
      }
    })
    return response.json(venda)
  }

  async list(request: Request, response: Response) {
    const venda = await prismaClient.venda.findMany({
      orderBy: {
        data_venda: "desc"
      }
    })
    return response.json(venda)
  }
}