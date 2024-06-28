import {connectionToken} from "../database/mysqlDbConfig.js";
import User from "../user/User.js";

class PasswordToken {
    async create(email) {
        try {
            var user = await User.findByEmail(email);
            if (user) {
                var token = Date.now(); // Você pode querer gerar um UUID único em vez de usar Date.now()
                await connectionToken.insert({
                    user_id: user.id,
                    used: 0,
                    token: token
                }).table("passwordtoken");

                return { status: true, token: token };
            } else {
                return { status: false, err: "O e-mail passado não existe no banco de dados!" };
            }
        } catch (err) {
            console.error("Erro durante a criação do token:", err);
            return { status: false, err: err.message };
        }
    }

    async validate(token) {
        try {
            var result = await connectionToken.select().where({ token: token }).table("passwordtoken");
            if (result.length > 0) {
                var tk = result[0];
                if (tk.used) {
                    return { status: false };
                } else {
                    return { status: true, token: tk };
                }
            } else {
                return { status: false };
            }
        } catch (err) {
            console.error("Erro durante a validação do token:", err);
            return { status: false, err: err.message };
        }
    }

    async setUsed(token) {
        try {
            await connectionToken.update({ used: 1 }).where({ token: token }).table("passwordtoken");
            return { status: true };
        } catch (err) {
            console.error("Erro ao definir o token como usado:", err);
            return { status: false, err: err.message };
        }
    }
}

export default new PasswordToken();
