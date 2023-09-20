-- CreateTable
CREATE TABLE "User" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "email" TEXT NOT NULL,
    "pwd_hash" CHAR(60) NOT NULL,
    "session_token" VARCHAR(32),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Conversation" (
    "id" BIGSERIAL NOT NULL,
    "user_id" BIGINT NOT NULL,
    "title" VARCHAR(32) NOT NULL,
    "waiting" BOOLEAN NOT NULL,

    CONSTRAINT "Conversation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Msg" (
    "conversation_id" BIGINT NOT NULL,
    "index" INTEGER NOT NULL,
    "from_user" BOOLEAN NOT NULL,
    "content" TEXT NOT NULL,
    "media" CHAR(32),

    CONSTRAINT "Msg_pkey" PRIMARY KEY ("conversation_id","index")
);

-- AddForeignKey
ALTER TABLE "Conversation" ADD CONSTRAINT "Conversation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Msg" ADD CONSTRAINT "Msg_conversation_id_fkey" FOREIGN KEY ("conversation_id") REFERENCES "Conversation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
