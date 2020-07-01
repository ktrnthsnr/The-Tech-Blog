// back-end
const express = require('express');
const routes = require('./controllers/');
// -- updated folder name routes to controllers
  // const routes = require('./routes');
const sequelize = require('./config/connection');
const app = express();
const PORT = process.env.PORT || 3002;

// front-end
const path = require('path');
const exphbs = require('express-handlebars');
// -- tests functions through jest
const helpers = require('./utils/helpers'); 
const hbs = exphbs.create({ helpers });

// ----------------- add for session control -----------------------// 
 // -- sets up an Express.js session and connects it to the Sequelize database
const session = require('express-session');

const SequelizeStore = require('connect-session-sequelize')(session.Store);

const sess = {
  secret: 'Super secret secret',  // replace with secret and store in .env
  cookie: {},
  resave: false,
  saveUninitialized: true,
  store: new SequelizeStore({
    db: sequelize
  })
};

app.use(session(sess));

// ----------------------------------------// 

app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

// back-end
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
// front-end middleware
app.use(express.static(path.join(__dirname, 'public')));


// turn on routes
app.use(routes);

// sync establishes or turns on connection to the database and server
    // Sequelize is taking the models and connecting them to associated database tables

// turn on connection to database and server
sequelize.sync({ force: false }).then(() => {       // set to 'true' to recreate all tables.
    app.listen(PORT, () => console.log('Now listening on port ' + PORT));
  });

//         // if set force: true, all tables will be recreated with npm start
// sequelize.sync({ force: false }).then(() => {
//   app.listen(PORT, () => console.log('Now listening'));
// });