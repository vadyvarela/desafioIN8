import { Request, Response } from 'express'
import { prismaClient } from '../database/prismaClient'

export class CreateVeiculosControllers {
  async create(request: Request, response: Response) {
    const { nome, modelo, marca, ano_fabricacao, cor, chassi } = request.body

    const veiculos = await prismaClient.veiculo.create({
      data: {
        ano_fabricacao,
        chassi,
        cor,
        marca,
        modelo,
        nome
      }
    })
    
    return response.json(veiculos)
  }

  async list(request: Request, response: Response) {
    const veiculos = await prismaClient.veiculo.findMany({
      orderBy: {
        nome: "desc"
      }
    })

    return response.json(veiculos)
  }

  async delete(request: Request, response: Response) {
    const { id } = request.params;
    const veiculos = await prismaClient.veiculo.delete({
      where: {
        id: id
      }
    })

    return response.json(veiculos)
  }
}