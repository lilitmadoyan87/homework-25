module.exports = (sequelize, Sequelize) => {
    const Skill = sequelize.define("skill", {
        name: Sequelize.STRING,
    })
    return Skill;
}