module.exports = (sequelize, Sequelize) => {
    const Request = sequelize.define("request", {
        isApproved: {
            type: Sequelize.TINYINT,
            allowNull: false,
            defaultValue: 0
        }
    })
    return Request
}