-- AlterTable
ALTER TABLE "conversation" ADD COLUMN     "createdOn" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "waiting" SET DEFAULT false;
