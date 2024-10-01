import { check, param, validationResult } from "express-validator";
import { StatusCodes } from "http-status-codes";
import RecetteModel from "./models/RecetteModel.js";

const addRequestValidator = [
  // Validation du titre
  check("titre")
    .notEmpty()
    .withMessage("Titre est obligatoire")
    .bail()
    .isLength({ min: 5, max: 100 })
    .withMessage("Le titre doit contenir entre 5 et 100 caractères!")
    .bail()
    .custom(async (value) => {
      const result = await RecetteModel.checkRecette(value);
      if (result !== 0) {
        throw new Error("Deux recettes ne peuvent pas avoir le même titre!");
      }
      return true;
    }),

  // Validation des ingrédients
  check("ingredients")
    .notEmpty()
    .withMessage("Les ingrédients sont obligatoires")
    .bail()
    .isLength({ min: 10, max: 500 })
    .withMessage("Les ingrédients doivent contenir entre 10 et 500 caractères"),

  // Validation du type
  check("type")
    .notEmpty()
    .withMessage("Le type est obligatoire")
    .bail()
    .isIn(["entrée", "plat", "dessert"])
    .withMessage('Le type doit être "entrée", "plat" ou "dessert"'),

  // Gestion des erreurs
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res
        .status(StatusCodes.UNPROCESSABLE_ENTITY)
        .json({ errors: errors.array() });
    }
    next();
  },
];

const updateRequestValidator = [
  // Validation de l'id
  param("id")
    .notEmpty()
    .withMessage("L'ID est requis!")
    .bail()
    .custom(async (value) => {
      const result = await RecetteModel.getById(value);
      if (result === 0) {
        throw new Error("Cette recette n'existe pas!");
      }
      return true;
    }),

  // Validation du titre
  check("titre")
    .notEmpty()
    .withMessage("Le titre est obligatoire")
    .bail()
    .isLength({ min: 5, max: 100 })
    .withMessage("Le titre doit contenir entre 5 et 100 caractères")
    .bail()
    .custom(async (value) => {
      const result = await RecetteModel.checkRecette(value);
      if (result !== 0) {
        throw new Error("Cette recette existe déjà!");
      }
      return true;
    }),

  // Validation des ingrédients
  check("ingredients")
    .notEmpty()
    .withMessage("Les ingrédients ne peuvent pas être vides!")
    .bail()
    .isLength({ min: 10, max: 500 })
    .withMessage("Les ingrédients doivent contenir entre 10 et 500 caractères"),

  // Validation du type
  check("type")
    .notEmpty()
    .withMessage("Le type de recette est obligatoire")
    .bail()
    .isIn(["entrée", "plat", "dessert"])
    .withMessage('Le type doit être "entrée", "plat" ou "dessert"'),

  // Gestion des erreurs
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res
        .status(StatusCodes.UNPROCESSABLE_ENTITY)
        .json({ errors: errors.array() });
    }
    next();
  },
];

const deleteRequestValidator = [
  // Validation de l'id
  param("id")
    .notEmpty()
    .withMessage("L'ID est obligatoire!")
    .bail()
    .custom(async (value) => {
      const result = await RecetteModel.getById(value);
      if (result == 0) {
        throw new Error("Cette recette n'existe pas!");
      }
      return true;
    }),

  // Gestion des erreurs
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res
        .status(StatusCodes.UNPROCESSABLE_ENTITY)
        .json({ errors: errors.array() });
    }
    next();
  },
];

export { addRequestValidator, updateRequestValidator, deleteRequestValidator };
