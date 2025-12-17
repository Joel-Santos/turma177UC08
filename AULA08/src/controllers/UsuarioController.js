import UsuarioModel from "../models/UsuarioModel.js";

export default class UsuarioController{

   static async listar(req, res){
        try {
            const result = await UsuarioModel.listarTodos();
            if(!result.rows || result.rows.length==0){
                res.status(400).json({msg: "Nenhum usuário no banco!"});
                return;
            }
             res.status(200).json({msg: "Usuários encontrados!", users: result.rows});
        } catch (error) {
            res.status(500).json({msg: "Erro ao listar os usuários", erro: error.message});
        }
    }
   static async criar(req, res){
        try {
            const {nome, email} = req.body;
            if(!nome || !email){
                res.status(400).json({msg: "Os dados devem ser preenchidos!"});
                return;
            }
            const result = await UsuarioModel.criar(nome, email);

            if(result){
                res.status(201).json({msg: "Usuário Cadastrado!"});
                return;
            }
             
        } catch (error) {
            res.status(500).json({msg: "Erro ao criar o usuário", erro: error.message});
        }
    }

    static async buscarPorId(req, res){
        try {
            const {id} = req.params;
            if(!id){
                res.status(400).json({msg: "Nenhum id passado como parâmetro!"});
                return;
            }
            const result = await UsuarioModel.buscarPorId(id);
            if(result.rows.length === 0){
                res.status(404).json({msg: "Nenhum usuário encontrado com este id."});
                return;
            }
            res.status(200).json({msg: "Usuário encontrado!", usuario: result.rows[0]});
        } catch (error) {
              res.status(500).json({msg: "Erro ao buscar usuário pelo id.", erro: error.message});
        }
    }

    static async deletar(req, res){
        try {
            const {id} = req.params;
            const result = await UsuarioModel.buscarPorId(id);
            if(result.rows.length===0){
                res.status(404).json({msg: "Nenhum usuário encontrado com este id para deletar"});
                return;
            }
            await UsuarioModel.deletar(id);
            res.status(200).json({msg: "Usuário deletado com sucesso!"});
        } catch (error) {
            res.status(500).json({msg:"Erro ao deletar o usuário", erro: error.message});
        }
    }

    static async atualizar(req, res){
        try {
            const {id} = req.params;
            const {nome, email} = req.body;
            const result = await UsuarioModel.buscarPorId(id);
            if(result.rows.length ===0){
                res.status(404).json({msg: "Nhum usuário encontrado com este id no processo de atualização"});
                return;
            }
            if(!nome || !email){
                res.status(400).json({msg: "Todos os campos devem ser preenchidos no processo de atualização!"});
                return
            }
            await UsuarioModel.atualizar(id, nome, email);
            res.status(200).json({msg: "Usuário atualizado com sucesso!"});
        } catch (error) {
            res.status(500).json({msg: "Erro interno ao atualizar", erro: error.message});
        }
    }
}