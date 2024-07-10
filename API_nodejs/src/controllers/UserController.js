import User from '../../src/user/User.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import PasswordToken from '../../src/user/PasswordToken.js'
import sanitization from '../validator/sanitization.js';

import * as dotenv from "dotenv";
dotenv.config()


class UserController {
    /*checked*/
    async create(req, res) {
        const { email, name, password } = req.body;
        if (email === undefined) {
            res.status(400).json({ err: "O e-mail é inválido!" });
            return;
        }
        const emailExists = await User.findEmail(email);

        if (emailExists) {
            res.status(406).json({ err: "O e-mail já está cadastrado!" });
            return;
        }

        await User.new(email, password, name);

        res.status(200).json({ message: "Tudo OK!" });
        res.status(200).redirect("/");
    }
    async login(req, res) {
        try {
            const { emailValue, password } = req.body;
            
            const email = sanitization('email', emailValue);

            if (!email || !password) {
                return res.status(400).json({ error: "Missing email or password" });
            }
    
            const user = await User.findByEmail(email);
    
            if (!user) {
                return res.status(401).json({ error: "Invalid email or password" });
            }
    
            const passwordMatch = await bcrypt.compare(password, user.password);
    
            if (!passwordMatch) {
                return res.status(401).json({ error: "Invalid email or password" });
            }
    
            const token = jwt.sign({ email: user.email, role: user.role }, process.env.SECRET_HASH);
            res.status(200).json({ message: "Tudo OK!" });

        } catch (error) {
            console.error("Error during login:", error);
            res.status(500).json({ error: "Internal Server Error" });
        }
    }
    /*checked*/

    /*testing*/
    async recoverPassword(req, res){
        const email = req.body.email;
        const result = await PasswordToken.create(email);
        if(result.status){
           res.status(200).json({ message: "Tudo OK!" });
           res.send("" + result.token);
        }else{
            res.status(406)
            res.send(result.err).json({ message: "Tudo OK!" });
        }
    }
    async changePassword(req, res){
        var token = req.body.token;
        var password = req.body.password;
        var isTokenValid = await PasswordToken.validate(token);
        if(isTokenValid.status){
            await User.changePassword(password,isTokenValid.token.user_id,isTokenValid.token.token);
            res.status(200);
            res.send("Senha alterada");
        }else{
            res.status(406);
            res.send("Token inválido!");
        }
    }
    async edit(req, res){
        var {id, name, role, email} = req.body;
        var result = await User.update(id,email,name,role);
        if(result != undefined){
            if(result.status){
                res.status(200);
                res.send("Tudo OK!");
            }else{
                res.status(406);
                res.send(result.err)
            }
        }else{
            res.status(406);
            res.send("Ocorreu um erro no servidor!");
        }
    }
    /*testing*/
    //new functions
    async requestFoods(req,res){
        try {
            const result = await User.findProducts('foods'); 
            res.json(result);
          } catch (error) {
            console.error('Erro ao buscar produtos de smartphones:', error);
            res.status(500).json({ error: 'Erro ao buscar produtos de smartphones' });
          }
    }
    async requestFoodProduct(req,res){
        const id = req.params.id;
        try{
            if (id >= 13){
                return res.status(404).json({error: 'Produto não encontrado'})
            }
            const result = await User.findProductInTable(id,'foods')
            if (!result) {
                return res.status(404).json({ error: 'Produto não encontrado' });
            }
            res.json(result)
        } catch(error){
            console.error('Produto não encontrado',error)
            res.status(500).json({error: 'Erro ao buscar produto Food'})
        }
    }
    async requestSmartphones(req,res){
        try {
            const result = await User.findProducts('smartphones'); 
            res.json(result);
          } catch (error) {
            console.error('Erro ao buscar produtos de smartphones:', error);
            res.status(500).json({ error: 'Erro ao buscar produtos de smartphones' });
          }
    }
    async requestSmartphonesProduct(req,res){
        const id = req.params.id;
        try{
            if (id >= 13){
                return res.status(404).json({error: 'Produto não encontrado'})
            }
            const result = await User.findProductInTable(id,'smartphones')
            if (!result) {
                return res.status(404).json({ error: 'Produto não encontrado' });
            }
            res.json(result)
        } catch(error){
            console.error('Produto não encontrado',error)
            res.status(500).json({error: 'Erro ao buscar produto Food'})
        }
    }
    async requestConsoles(req,res){
        try {
            const result = await User.findProducts('consoles'); 
            res.json(result);
          } catch (error) {
            console.error('Erro ao buscar produtos de smartphones:', error);
            res.status(500).json({ error: 'Erro ao buscar produtos de smartphones' });
          }
    }
    async requestConsolesProduct(req,res){
        const id = req.params.id;
        try{
            if (id >= 13){
                return res.status(404).json({error: 'Produto não encontrado'})
            }
            const result = await User.findProductInTable(id,'consoles')
            if (!result) {
                return res.status(404).json({ error: 'Produto não encontrado' });
            }
            res.json(result)
        } catch(error){
            console.error('Produto não encontrado',error)
            res.status(500).json({error: 'Erro ao buscar produto Food'})
        }
    }
    async requestKitchen(req,res){
        try {
            const result = await User.findProducts('kitchenproducts'); 
            res.json(result);
          } catch (error) {
            console.error('Erro ao buscar produtos de smartphones:', error);
            res.status(500).json({ error: 'Erro ao buscar produtos de smartphones' });
          }
    }
    async requestDrinks(req,res){
        try {
            const result = await User.findProducts('drinks'); 
            res.json(result);
          } catch (error) {
            console.error('Erro ao buscar produtos de smartphones:', error);
            res.status(500).json({ error: 'Erro ao buscar produtos de smartphones' });
          }
    }
    async requestConsolesProduct(req,res){
        const id = req.params.id;
        try{
            if (id >= 13){
                return res.status(404).json({error: 'Produto não encontrado'})
            }
            const result = await User.findProductInTable(id,'drinks')
            if (!result) {
                return res.status(404).json({ error: 'Produto não encontrado' });
            }
            res.json(result)
        } catch(error){
            console.error('Produto não encontrado',error)
            res.status(500).json({error: 'Erro ao buscar produto Food'})
        }
    }
    async requestComputers(req,res){
        try {
            const result = findProducts('computers');
            res.json(result);
          } catch (error) {
            console.error('Erro ao buscar produtos de smartphones:', error);
            res.status(500).json({ error: 'Erro ao buscar produtos de smartphones' });
          }
    }
}

export default new UserController;