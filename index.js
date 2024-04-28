const express = require('express');
const app = express();
const passport = require('passport');
const session = require('express-session');
const router = require('./routers/router');
const cookieParser = require('cookie-parser')
const port = process.env.PORT || 8080;
const cors = require('cors');
const customer = require('./routers/customer');
const { typeCustomer, typeFreelancer } = require('./middleware/role');
const freelancer = require('./routers/freelancer');

app.use(express.static('public'))
app.use(express.json())
app.use(express.urlencoded({
    extended: false
}))

app.use(cors({ 
    origin: "http://localhost:3000/*"
})) 

app.use(session({
    secret: 'topSecret',
    resave: true,
    saveUninitialized: true,
    cookie: { secure: true } 
}));

app.use(cookieParser())
app.use(passport.initialize());
app.use(passport.session())
require('./middleware/passport')(passport);
app.use('/', router);
app.use('/freelancer', passport.authenticate('jwt', { session: false }),typeFreelancer ,freelancer);
app.use('/customer', passport.authenticate('jwt', { session: false }), typeCustomer, customer);

app.listen(port, () => console.log(`listening  http://localhost:${port}`))
