import 'dotenv';
import express, { type Application } from 'express';
import cors from 'cors';
import { router } from './routes/index';

export const app: Application = express();
app.use(express.json());
app.use(cors());
app.use(router);

const PORT: number = Number(process.env.PORT) || 3333;
app.listen(PORT, () => {
    console.log(`App is running at port ${PORT}`)
})