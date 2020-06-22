const router = require('express').Router();
const sequelize = require('../config/connection');
const { Post, User, Comment } = require('../models');


// GET http://localhost:3002/dashboard
router.get('/', (req, res) => {
    res.render('dashboard', { loggedIn: true });
  });

module.exports = router;