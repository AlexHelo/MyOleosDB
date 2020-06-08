const Pool = require('pg').Pool
const pool = new Pool({
    user: 'root',
    host: 'localhost',
    database: 'myoleosdb',
    password: 'toor',
    port: 5432,
})


const getOrders = async (req, res) => {
    const response = await pool.query('SELECT * FROM orders ORDER BY OrderID ASC');
    res.status(200).json(response.rows);
};

// const getOrdersByType = async (req, res) => {
//     const Type = String(req.params.Type);
//     const response = await pool.query('SELECT * FROM orders WHERE Type = $1', [Type]);
//     res.json(response.rows);
// };

const getOrdersByID = async (req, res) => {


};

const createOrder = (request, response) => {
    const { Payment, Type, Cost, Status } = request.body

    pool.query('INSERT INTO orders (name, email) VALUES ($1, $2)', [name, email], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`User added with ID: ${result.insertId}`)
    })
}

const getProducts = async (req, res) => {
    const response = await pool.query('SELECT * FROM product ORDER BY ProductID ASC');
    res.status(200).json(response.rows);
};

const getUsers = async (req, res) => {
    console.log(req.params);
    const response = await pool.query('SELECT * FROM users ORDER BY UserID ASC');
    res.status(200).json(response.rows);
};

const getUsersByID = async (req, res) => {
    const UserID = parseInt(req.params.UserID);
    const response = await pool.query('SELECT * FROM users WHERE UserID = $1', [UserID]);
    res.json(response.rows);
};

const createUser = (request, response) => {
    const { username, address, phone, password } = request.body

    pool.query('INSERT INTO users (UserName, Address, Phone, Password) VALUES ($1, $2, $3, $4)', [username, address, phone, password], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`User added with ID: ${results.insertId}`)
    })
}

const deleteUsersByID = async (req, res) => {
    console.log(req.params)
    const UserID = parseInt(req.params.UserID);
    const response = await pool.query('DELETE FROM users WHERE UserID = $1', [UserID]);
    res.status(200).send(`User deleted with ID: ${UserID}`)
}
module.exports = {
    getOrders,
    getOrdersByID,
    getProducts,
    getUsers,
    getUsersByID,
    deleteUsersByID,
    createUser
}