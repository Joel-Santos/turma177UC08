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



}