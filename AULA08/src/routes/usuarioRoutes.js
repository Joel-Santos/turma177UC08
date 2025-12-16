import UsuarioController from "../controllers/UsuarioController.js";
import express from "express";
const router = express.Router();

router.get("/", UsuarioController.listar);

router.post("/", UsuarioController.criar);

export default router;