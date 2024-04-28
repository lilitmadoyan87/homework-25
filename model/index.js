const {Sequelize} = require('sequelize')

const sequelize = new Sequelize('node_jwt2', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    port: 3306
});

const User = require("./user")(sequelize, Sequelize)
const Work = require("./Work")(sequelize, Sequelize)
const Request = require("./Request")(sequelize, Sequelize)
const Skill = require("./Skill")(sequelize, Sequelize)
const SkillWork = require("./SkillWork")(sequelize, Sequelize)

Work.belongsTo(User, {onUpdate: "cascade", onDelete: "cascade"})
Request.belongsTo(User, {onUpdate: "cascade", onDelete: "cascade"})
Request.belongsTo(Work, {onUpdate: "cascade", onDelete: "cascade"})
Skill.belongsTo(User, {onUpdate: "cascade", onDelete: "cascade"})
SkillWork.belongsTo(Work, {onUpdate: "cascade", onDelete: "cascade"})
SkillWork.belongsTo(Skill, {onUpdate: "cascade", onDelete: "cascade"})

User.hasMany(Work, {onUpdate: "cascade", onDelete: "cascade"})
User.hasMany(Request, {onUpdate: "cascade", onDelete: "cascade"})
Work.hasMany(Request, {onUpdate: "cascade", onDelete: "cascade"})
User.hasMany(Skill, {onUpdate: "cascade", onDelete: "cascade"})

sequelize.sync()
module.exports = {
    User, Work, Request, Skill,SkillWork,
    sequelize
}