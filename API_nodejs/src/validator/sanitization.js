const sanitization = (type, value) => {
    switch(type){
        case 'email':
            if (typeof value !== 'string') {
                return null; // Retornar nulo se o valor não for uma string
            }
            // Remove espaços em branco e converte para minúsculas
            value = value.replace(/\s+/g, '').toLowerCase();
            // Verifica se o valor corresponde ao padrão de e-mail
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
                return null; // Retornar nulo se o e-mail for inválido
            }
            return value;
        case 'password':
            // Verifica se a senha tem pelo menos 8 caracteres
            return typeof value === 'string' && value.length >= 8;
        default:
            return null; // Retornar nulo para tipos desconhecidos
    }
}

export default sanitization;
