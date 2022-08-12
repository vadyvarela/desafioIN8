-- CreateTable
CREATE TABLE "compra" (
    "id" TEXT NOT NULL,
    "valor_compra" DOUBLE PRECISION NOT NULL,
    "data_compra" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_vehicles" TEXT NOT NULL,

    CONSTRAINT "compra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "venda" (
    "id" TEXT NOT NULL,
    "valor_venda" DOUBLE PRECISION NOT NULL,
    "data_venda" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id_vehicles" TEXT NOT NULL,

    CONSTRAINT "venda_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "compra" ADD CONSTRAINT "compra_id_vehicles_fkey" FOREIGN KEY ("id_vehicles") REFERENCES "veiculos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "venda" ADD CONSTRAINT "venda_id_vehicles_fkey" FOREIGN KEY ("id_vehicles") REFERENCES "veiculos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
