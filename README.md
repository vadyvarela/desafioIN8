# Sistema para uma agência de veículos

## O sistema e capaz de:
 - Cadastrar e listar todos os veiculos
 - Fazer venda de um determinado veiculos
 - Listar todos os veiculos vendidos
 - Fazer compra de um determkinado veiculo
 - Listar todos os veiculos comprados

## **BACKEND**
 - Node Js ( Express & Prisma)
 - Banco de Dados ( Postgress )

 ### **Como inicializar Backend**
  1. yarn install
  2. Criar .ENV com = DATABASE_URL="postgresql://seu_user:seu_password@localhost:5432/seu_banco_de_dados?schema=public"
  3. Iniciar Migration = yarn prisma migrate dev
  4. yarn dev para iniciar server

## **FRONTEND**
 - Desenvolvido com Flutter
