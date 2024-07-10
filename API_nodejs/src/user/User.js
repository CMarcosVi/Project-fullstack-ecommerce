import {connection, connectionProducts} from '../database/mysqlDbConfig.js';
import bcrypt from 'bcrypt'

class User {
    /*checked*/
    async new(email, password, name) {
        try {
            const hash = await bcrypt.hash(password, 10);
            await connection.insert({ email, password: hash, name, role: 0 }).table("usuarios");
        } catch (err) {
            console.log(err);
        }
    }
    async findEmail(email) {
        try {
            const result = await connection.select("*").from("usuarios").where({ email });

            if (result.length > 0) {
                return true;
            } else {
                return false;
            }
        } catch (err) {
            console.log(err);
            return false;
        }
    }
    async findByEmail(email){
        try{
            const request = await connection.select(["id","name","email","password","role"]).where({email:email}).table("usuarios")
            if(request.length > 0){
                return request[0];
            }else{
                return undefined;
            }
        }catch(err){
            console.log(err);
            return undefined;
        }  
    }
    /*checked*/

    /*testing*/
    async changePassword(newPassword,id,token){
        try{
            const hash = await bcrypt.hash(newPassword, 10);
            await connection('usuarios').update({ password: hash }).where({ id: id });
            await PasswordToken.setUsed(token);
            return { success: true, message: "Senha alterada com sucesso" };
        } catch (error) {
            console.error("Erro ao alterar senha:", error);
            return { success: false, message: "Erro ao alterar senha" };
        }
    }
    async update(id,email,name,role){

        var user = await this.findById(id);

        if(user != undefined){

            var editUser = {};

            if(email != undefined){ 
                if(email != user.email){
                   var result = await this.findEmail(email);
                   if(result == false){
                        editUser.email = email;
                   }else{
                        return {status: false,err: "O e-mail já está cadastrado"}
                   }
                }
            }

            if(name != undefined){
                editUser.name = name;
            }

            if(role != undefined){
                editUser.role = role;
            }

            try{
                await connection.update(editUser).where({id: id}).table("usuarios");
                return {status: true}
            }catch(err){
                return {status: false,err: err}
            }
            
        }else{
            return {status: false,err: "O usuário não existe!"}
        }
    }
    /*testing*/

    //New functions
    async findProducts(table){
        try {
            const result = await connectionProducts.select("*").from(table);
            return { products: result }
        }catch (err) {
            console.log(err);
            return false;
        }
    }
    async findProductInTable(id,table){
        try {
            if (!id || !table) {
                throw new Error('É necessário fornecer id e nome da tabela');
              }
            const result = await connectionProducts(table).select('*').where({ id }).first(); // Invocação correta do método first()
            return { products: result }
        }catch (err) {
            console.log(err);
            return false;
        }
    }
}

export default new User;