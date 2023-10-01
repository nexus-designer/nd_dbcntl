import { PrismaClient } from "@prisma/client";
import { hashSync } from "bcrypt";
import { randomBytes } from "crypto";

async function seed(prisma: PrismaClient) {
	await prisma.user.create({
		data: {
			name: "Tester",
			email: "test@gmail.com",
			pwdHash: hashSync("test", 10),
			sessionToken: "2f47894d2ad1927d994c4a8ad4613d3e",
		},
	});
}

async function main() {
	const prisma = new PrismaClient();
	await seed(prisma);

	// Close the connection
	try {
		await prisma.$disconnect();
	} catch (e) {
		console.error(e);
		await prisma.$disconnect();
		process.exit(1);
	}
}

main();
