const express = require("express")
const freelancer = express.Router()
const { FreelancerController } = require("../controller/FreelancerController");

freelancer.get("/allWorks", FreelancerController.seeWorks)
freelancer.get("/sendRequest/:id", FreelancerController.sendRequest)
freelancer.get("/seeApprovedWorks", FreelancerController.seeApprovedWorks)
freelancer.get("/seeRequestedWorks", FreelancerController.seeRequestedWorks)
freelancer.get("/searchWorkBySkill/?", FreelancerController.searchWorkBySkill)
freelancer.get("/searchWorkByUserSkill",FreelancerController.searchWorkByUserSkill)

freelancer.post("/addSkill", FreelancerController.addSkill)

module.exports = freelancer