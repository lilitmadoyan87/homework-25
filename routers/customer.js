const express = require("express")
const customer = express.Router()
const { CustomerController } = require("../controller/CustomerController");

customer.get("/allWorks", CustomerController.seeWorks)
customer.get('/requestedWorks', CustomerController.seeRequestedWorks)
customer.get("/confirmRequest/:id", CustomerController.confirmRequest)
customer.post('/addWork', CustomerController.addWork)

module.exports = customer