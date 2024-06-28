import {Router} from 'express';
import UserController from '../controllers/UserController.js';
import HomeController from '../controllers/HomeController.js';

const routes = Router();

routes.get('/', HomeController.index);
routes.post('/accountCreate', UserController.create);
routes.post('/login', UserController.login);
routes.post('/changePassword', UserController.changePassword);
routes.post("/recoverpassword",UserController.recoverPassword);
//routes.get("/bestSellersProducts",UserController.bestSellersProducts);
routes.get("/computersListProducts",UserController.requestComputers);
routes.get("/drinksListProducts",UserController.requestDrinks);
routes.get("/foodsListProducts",UserController.requestFoods);
routes.get("/gamesAndConsolesListProducts",UserController.requestConsoles);
routes.get("/kitchenListProducts",UserController.requestKitchen);
//routes.get("/offersListProducts",UserController.recoverPassword);
routes.get("/smartPhonesListProducts",UserController.requestSmartphones);

export default routes;
