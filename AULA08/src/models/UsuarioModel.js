import db from "../config/db.js";

export default class UsuarioModel{

    static listarTodos(){
        const sql = `select id, nome, email FROM usuarios`;
        return db.query(sql);
    }

    static criar(nome,email){
        const sql = `insert into usuarios (nome,email) values ($1, $2)`;
        return db.query(sql, [nome, email]);  
    }

}
