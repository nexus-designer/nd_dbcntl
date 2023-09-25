/*
  Warnings:

  - You are about to drop the `Conversation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Msg` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Conversation" DROP CONSTRAINT "Conversation_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Msg" DROP CONSTRAINT "Msg_conversation_id_fkey";

-- DropTable
DROP TABLE "Conversation";

-- DropTable
DROP TABLE "Msg";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "email" TEXT NOT NULL,
    "pwdHash" CHAR(60) NOT NULL,
    "sessionToken" VARCHAR(32),

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conversation" (
    "id" BIGSERIAL NOT NULL,
    "userId" BIGINT NOT NULL,
    "title" VARCHAR(32) NOT NULL,
    "waiting" BOOLEAN NOT NULL,

    CONSTRAINT "conversation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "msg" (
    "id" BIGSERIAL NOT NULL,
    "conversationId" BIGINT NOT NULL,
    "index" INTEGER NOT NULL,
    "fromBot" BOOLEAN NOT NULL,
    "content" TEXT NOT NULL,
    "media" CHAR(32),

    CONSTRAINT "msg_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "conversation" ADD CONSTRAINT "conversation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "msg" ADD CONSTRAINT "msg_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES "conversation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
