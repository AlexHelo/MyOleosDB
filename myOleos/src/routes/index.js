const { Router } = require('express');
const router = Router();

const { getOrders, getOrdersByID, getOrdersByCost, getProducts, getUsers, getUsersByID, deleteUsersByID, createUser } = require('../controllers/index.controller');

router.get('/orders', getOrders);
//router.get('/orders/:Type', getOrdersByType);
router.get('/orders/:OrderID', getOrdersByID);

router.get('/products', getProducts);

router.get('/users', getUsers);
router.get('/users/:UserID', getUsersByID);
router.delete('/users/:UserID', deleteUsersByID);
router.post('/users', createUser)

module.exports = router;