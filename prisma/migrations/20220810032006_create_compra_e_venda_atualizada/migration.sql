/*
  Warnings:

  - You are about to drop the column `id_vehicles` on the `compra` table. All the data in the column will be lost.
  - You are about to drop the column `id_vehicles` on the `venda` table. All the data in the column will be lost.
  - Added the required column `id_veiculos` to the `compra` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_veiculos` to the `venda` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "compra" DROP CONSTRAINT "compra_id_vehicles_fkey";

-- DropForeignKey
ALTER TABLE "venda" DROP CONSTRAINT "venda_id_vehicles_fkey";

-- AlterTable
ALTER TABLE "compra" DROP COLUMN "id_vehicles",
ADD COLUMN     "id_veiculos" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "venda" DROP COLUMN "id_vehicles",
ADD COLUMN     "id_veiculos" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_id_veiculos_fkey" FOREIGN KEY ("id_veiculos") REFERENCES "veiculos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "venda_id_veiculos_fkey" FOREIGN KEY ("id_veiculos") REFERENCES "veiculos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
