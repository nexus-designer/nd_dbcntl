/*
  Warnings:

  - The primary key for the `Msg` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "Msg" DROP CONSTRAINT "Msg_pkey",
ADD COLUMN     "id" BIGSERIAL NOT NULL,
ADD CONSTRAINT "Msg_pkey" PRIMARY KEY ("id");
