const express = require('express')
const bodyParser = require('body-parser')
const helmet = require('helmet')
const compression = require('compression')
const app = express()
const port = 3000

// Middleware
app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)
app.use(compression())
app.use(helmet())
app.use(express.json());
app.use(express.static('public'));

//Routes
app.use(require('./routes/index'));

// app.get('/', (request, response) => {
//     response.sendFile('../public/index.html')
// })


app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})