// front-end, all user-facing routes, ie. homepage and login page
const router = require('express').Router();

// populate the template with sequelize data
const sequelize = require('../config/connection');
const { Post, User, Comment } = require('../models');

// -- test
    // router.get('/', (req, res) => {
    //   res.render('homepage');
    // });

// -- test
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

// -------------------- populate the template with sequelize data 
// -- GET ttp://localhost:3001/post ( validation URL within Insomnia )
router.get('/', (req, res) => {
    console.log(req.session);
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
      res.render('homepage', { posts, 
        loggedIn: req.session.loggedIn }); // added for login
    })
    .catch(err => {
      console.log(err);
      res.status(500).json(err);
    });
});

// ----------------------------  login 
//test  GET post http://localhost:3001/login
router.get('/login', (req, res) => {
    if (req.session.loggedIn) {
      res.redirect('/');
      return;
    }
  
    res.render('login');
  });

// -------------------------- route to a single post
// //test  GET post http://localhost:3001/post/1
router.get('/post/:id', (req, res) => {
    Post.findOne({
      where: {
        id: req.params.id
      },
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
        if (!dbPostData) {
          res.status(404).json({ message: 'No post found with this id' });
          return;
        }
  
        // serialize the data
        const post = dbPostData.get({ plain: true });
  
        // pass data to template
        res.render('single-post', { 
          post,
          loggedIn: req.session.loggedIn    // -- only show comments form when logged in
        });
      })
      .catch(err => {
        console.log(err);
        res.status(500).json(err);
      });
  });


  // // -- test for route to a single post 
    // //test  GET post http://localhost:3002/post/1
    //   router.get('/post/:id', (req, res) => {
    //     const post = {
    //       id: 1,
    //       post_url: 'https://express_session.com/guide/',
    //       title: 'Express Session Docs',
    //       created_at: new Date(),
    //       vote_count: 9,
    //       comments: [{}, {}],
    //       user: {
    //         username: 'tester'
    //       }
    //     };
      
    //     res.render('single-post', { post });
    //   });

module.exports = router;

