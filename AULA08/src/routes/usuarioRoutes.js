import UsuarioController from "../controllers/UsuarioController.js";
import express from "express";
const router = express.Router();

router.get("/", UsuarioController.listar);

router.post("/", UsuarioController.criar);

router.get("/:id", UsuarioController.buscarPorId);

router.delete("/:id", UsuarioController.deletar);

router.put("/:id", UsuarioController.atualizar);

export default router;