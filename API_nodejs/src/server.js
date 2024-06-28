import express from 'express';
import bodyParser from 'body-parser';
import router from './routes/routes.js';
import cors from 'cors';
import helmet from 'helmet';

const app = express();

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(helmet());
app.use(router);

app.listen(3000);
