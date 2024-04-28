const { Work, Request, Skill, SkillWork } = require("../model")

class CustomerController {
    static async addWork(req, res) {
        try {
            const work = await Work.create({ ...req.body, userId: req.user.id })
            const skills = await Skill.findAll()
            for (let e in skills) {
                if (work.skills.includes(skills[e].name)) {
                    await SkillWork.create({ skillId: skills[e].id, workId: work.id })
                } else {
                    continue

                }
            }
            res.send({ message: "Work was created" })
        } catch (e) {
            res.send({ message: "Work could not be created" })
        }
    }

    static async seeWorks(req, res) {
        try {
            const data = await Work.findAll({ where: { userId: req.user.id } })
            res.send({ data })
        } catch (e) {
            res.send({ message: "Couldn't get works" })
        }
    }

    static async seeRequestedWorks(req, res) {
        try {
            const data = await Request.findAll({
                where:{isApproved: 0},
                include: [{
                    model: Work,
                    where: {
                        userId: req.user.id
                    }
                }]
            })
            res.send({ data })
        } catch (e) {
            res.send({ message: "Couldn't get works" })
        }
    }

    static async confirmRequest(req, res) {
        try {
            const { id } = req.params
            const work = await Work.findByPk(id)
            if (work) {
                const request = await Request.findOne({
                    where: {
                        workId: id
                    }
                })
                if (request) {
                    await Request.update({ isApproved: 1 }, { where: { workId: id } })
                    res.send({ message: "Request was approved" })
                }
            } else {
                res.send({ message: "Work does not exist" })
            }
        } catch (e) {
            res.send({ message: "Request counld not be approved" })
        }
    }

}

module.exports = { CustomerController }