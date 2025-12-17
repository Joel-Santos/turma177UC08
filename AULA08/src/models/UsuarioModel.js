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

    static buscarPorId(id){
        const sql = `select id, nome, email from usuarios where id = $1`;
        return db.query(sql, [id]);
    }

    static deletar(id){
        const sql = `delete from usuarios where id = $1`;
        return db.query(sql, [id]);
    }

    static atualizar(id, nome, email){
        const sql = `update usuarios set nome = $1, email = $2 where id = $3`;
        return db.query(sql, [nome, email, id]);
    }


}
