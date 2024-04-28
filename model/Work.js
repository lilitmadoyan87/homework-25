module.exports = (sequelize, Sequelize) => {
    const Work = sequelize.define("work", {
        name: Sequelize.STRING,
        price: Sequelize.INTEGER,
        time: Sequelize.STRING,
        description: Sequelize.STRING,
        skills: Sequelize.STRING,
    })
    return Work
}