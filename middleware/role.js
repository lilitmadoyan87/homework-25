module.exports.typeFreelancer = (req, res, next) => {
    if (req.user.type == 0) {
        return next()
    }
    return res.send("Freelancer type invalid")
}
module.exports.typeCustomer = (req, res, next) => {
    if (req.user.type == 1) {
        return next()
    }
    return res.send("Customer type invalid")
}