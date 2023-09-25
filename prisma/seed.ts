import { PrismaClient } from "@prisma/client";
import { hashSync } from "bcrypt";

async function seed(prisma: PrismaClient) {
	await prisma.user.create({
		data: {
			name: "Tester",
			email: "test@gmail.com",
			pwdHash: hashSync("test", 10),
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
