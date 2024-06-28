import * as dotenv from "dotenv";
import knex from 'knex';
dotenv.config();

const dbConfig = {
  client: 'mysql2',
  connection: {
    host: process.env.DB_HOST,
    port: 3306,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
  },
};

const dbConfigToken = {
  client: 'mysql2',
  connection: {
    host: process.env.DB_HOST,
    port: 3306,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
  },
};

const dbProducts = {
  client: 'mysql2',
  connection: {
    host: process.env.DB_HOST,
    port: 3306,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME2,
  },
}

const connection = knex(dbConfig);
const connectionToken = knex(dbConfigToken);
const connectionProducts =knex(dbProducts);


export { connection, connectionToken, connectionProducts };