# ANOTAÇÕES
npm init -y
npm i -D typescript ts-node nodemon prisma @types/node
npx tsc --init
npm i @prisma/client @prisma/adapter-mariadb express @types/express dotenv
npx prisma init
npx prisma migrate dev --name authSystem
npx prisma generate
npm i bcryptjs jsonwebtoken
npm i -D @types/jsonwebtoken @types/bcryptjs
npm i cors
npm i -D @types/cors