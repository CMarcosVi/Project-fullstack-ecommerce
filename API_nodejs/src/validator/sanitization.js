const sanitization = (type, value) => {
    if (typeof value !== 'string') {
        console.log(typeof value);
        console.log('valor Invalido');
        return null; // Retornar nulo se o valor não for uma string
    }

    switch(type){
        case 'email':
            // Remove espaços em branco e converte para minúsculas
            value = value.trim().toLowerCase();
            // Verifica se o valor corresponde ao padrão de e-mail
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(value)) {
                console.log('valor Null');
                return null; // Retornar nulo se o e-mail for inválido
            }
            return value;

        case 'password':
            // Verifica se a senha tem pelo menos 8 caracteres
            return value.length >= 8;

        default:
            return null; // Retornar nulo para tipos desconhecidos
    }
};

export default sanitization;
