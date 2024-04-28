const { Op } = require("sequelize")
const { Work, Request, Skill, SkillWork } = require("../model")

class FreelancerController {
    static async seeWorks(req, res) {
        try {
            const data = await Work.findAll()
            res.send({ data })
        } catch (e) {
            res.send({ message: "Couldn't get works" })
        }
    }

    static async sendRequest(req, res) {
        try {
            const { id } = req.params
            const work = await Work.findByPk(id)
            if (work) {
                await Request.create({ userId: req.user.id, workId: id })
                res.send({ message: "Request was send" })
            } else {
                res.send({ message: "Work does not exist" })
            }
        } catch (e) {
            res.send({ message: "You should be a freelancer" })
        }
    }

    static async seeApprovedWorks(req, res) {
        try {
            const data = await Work.findAll({
                include: [{
                    model: Request,
                    where: {
                        userId: req.user.id,
                        isApproved: 1
                    }
                }]
            })
            res.send({ data })
        } catch (e) {
            res.send({ message: "You should be a freelancer" })
        }
    }

    static async seeRequestedWorks(req, res) {
        try {
            const data = await Work.findAll({
                include: [{
                    model: Request,
                    where: {
                        userId: req.user.id,
                        isApproved: 0
                    }
                }]
            })
            res.send({ data })
        } catch (e) {
            res.send({ message: "You should be a freelancer" })
        }
    }

    static async addSkill(req, res) {
        try {
            const skill = await Skill.create({ ...req.body, userId: req.user.id })
            const works = await Work.findAll()
            for (let e in works) {
                if (works[e].skills.includes(skill.name)) {
                    await SkillWork.create({ skillId: skill.id, workId: works[e].id })
                } else {
                    continue

                }
            }
            res.send({ message: "Skill was created" })
        } catch (e) {
            res.send({ message: "You should be a freelancer" })
        }
    }

    static async searchWorkBySkill(req, res) {
        try {
            const { name } = req.query
            const works = await Work.findAll({
                where: {
                    skills: {
                        [Op.like]: `%${name}%`
                    }
                }
            })
            res.send({works})
        } catch (e) {
            res.send({ message: "Could not search works" })
        }
    }

    static async searchWorkByUserSkill(req, res) {
        try {
            const skillwork = await SkillWork.findAll({
                include: [{
                    model: Skill,
                    where: { userId: req.user.id }
                }, Work]
            })
            const data = []
            for (let e in skillwork) {
                data.push(skillwork[e].work)
            }
            res.send({ data })
        } catch (e) {
            res.send({ message: "Could not search works" })
        }
    }
}

module.exports = { FreelancerController }