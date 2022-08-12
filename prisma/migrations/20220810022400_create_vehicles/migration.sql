-- CreateTable
CREATE TABLE "veiculos" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "modelo" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "ano_fabricacao" TIMESTAMP(3) NOT NULL,
    "cor" TEXT NOT NULL,
    "chassi" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "veiculos_pkey" PRIMARY KEY ("id")
);
