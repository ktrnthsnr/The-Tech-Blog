// front-end, all user-facing routes, ie. homepage and login page
const router = require('express').Router();

// populate the template with sequelize data
const sequelize = require('../config/connection');
const { Post, User, Comment } = require('../models');

// -- test
    // router.get('/', (req, res) => {
    //   res.render('homepage');
    // });

// router.get('/', (req, res) => {
//   res.render('homepage', {
//     id: 1,
//     post_url: 'https://handlebarsjs.com/guide/',
//     title: 'Handlebars Docs',
//     created_at: new Date(),
//     vote_count: 10,
//     comments: [{}, {}],
//     user: {
//       username: 'test_user'
//     }
//   });
// });

// populate the template with sequelize data
router.get('/', (req, res) => {
  Post.findAll({
    attributes: [
      'id',
      'post_url',
      'title',
      'created_at',
      [sequelize.literal('(SELECT COUNT(*) FROM vote WHERE post.id = vote.post_id)'), 'vote_count']
    ],
    include: [
      {
        model: Comment,
        attributes: ['id', 'comment_text', 'post_id', 'user_id', 'created_at'],
        include: {
          model: User,
          attributes: ['username']
        }
      },
      {
        model: User,
        attributes: ['username']
      }
    ]
  })
    .then(dbPostData => {
      // pass a single post object into the homepage template
      const posts = dbPostData.map(post => post.get({ plain: true }));
      console.log(dbPostData[0]);
      // res.render('homepage', dbPostData[0]);
      // // res.render('homepage', dbPostData[0].get({ plain: true }));
      res.render('homepage', { posts });
    })
    .catch(err => {
      console.log(err);
      res.status(500).json(err);
    });
});

// login
router.get('/login', (req, res) => {
  res.render('login');
});


module.exports = router;

