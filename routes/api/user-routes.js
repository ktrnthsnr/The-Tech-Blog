// Express.js router
const router = require('express').Router();
const { User } = require('../../models');

// ========================== GET /api/users
// test route in browser:  http://localhost:3001/api/users
// router.get('/', (req, res) => {});
router.get('/', (req, res) => {
    // Access our User model and run .findAll() method)
    //.findAll Model class method is equal to this SQL query: SELECT * FROM users;
    User.findAll({
        attributes: { exclude: ['password'] }
      })
        .then(dbUserData => res.json(dbUserData))
        .catch(err => {
          console.log(err);
          res.status(500).json(err);
    });
});


// ========================== GET /api/users/1
// router.get('/:id', (req, res) => {});
// .findOne Model class is similar to this SQL query: SELECT * FROM users WHERE id = 1
// GET /api/users/1
router.get('/:id', (req, res) => {
    User.findOne({
      where: {
        id: req.params.id
      }
    })
      .then(dbUserData => {
        if (!dbUserData) {
          res.status(404).json({ message: 'No user found with this id' });
          return;
        }
        res.json(dbUserData);
      })
      .catch(err => {
        console.log(err);
        res.status(500).json(err);
      });
  });
  

//  ========================== POST /api/users -- create a new user
// router.post('/', (req, res) => {});
// equivalent to this SQL query:
        // INSERT INTO users
        //   (username, email, password)
        // VALUES
        //   ("Lernantino", "lernantino@gmail.com", "password1234");
router.post('/', (req, res) => {
    // expects {username: 'Lernantino', email: 'lernantino@gmail.com', password: 'password1234'}
    User.create({
        username: req.body.username,
        email: req.body.email,
        password: req.body.password
    })
        .then(dbUserData => res.json(dbUserData))
        .catch(err => {
        console.log(err);
        res.status(500).json(err);
        });
    });

// route found at http://localhost:3001/api/users/login
router.post('/login', (req, res) => {
    // expects {email: 'lernantino@gmail.com', password: 'password1234'}
      User.findOne({
        where: {
          email: req.body.email
        }
      }).then(dbUserData => {
        if (!dbUserData) {
          res.status(400).json({ message: 'No user with that email address!' });
          return;
        }
    
        res.json({ user: dbUserData }); 
    
        // Verify user
    
      });  
    });

// test in Insomnia POST http://localhost:3001/api/users
        // {
        //     "username": "",
        //     "email": "",
        //     "password": ""
        // }
        



// ========================== PUT /api/users/1 -- update a user's info
// router.put('/:id', (req, res) => {});
// equiv to this SQL query: 
        // UPDATE users
        // SET username = "Lernantino", email = "lernantino@gmail.com", password = "newPassword1234"
        // WHERE id = 1;
// PUT /api/users/1
router.put('/:id', (req, res) => {
  // expects {username: 'Lernantino', email: 'lernantino@gmail.com', password: 'password1234'}

  // pass in req.body instead to only update what's passed through
  User.update(req.body, {
    individualHooks: true,      // hook set to true afer user.js model bcrypt added to hash the user password
    where: {
      id: req.params.id
    }
  })
      .then(dbUserData => {
        if (!dbUserData[0]) {
          res.status(404).json({ message: 'No user found with this id' });
          return;
        }
        res.json(dbUserData);
      })
      .catch(err => {
        console.log(err);
        res.status(500).json(err);
      });
  });
  

// ========================== DELETE /api/users/1    --- delete a user  
// router.delete('/:id', (req, res) => {});
// equiv to this SQL query:
    //   DELETE FROM users where ID = 1
router.delete('/:id', (req, res) => {
    User.destroy({
        where: {
        id: req.params.id
        }
    })
        .then(dbUserData => {
        if (!dbUserData) {
            res.status(404).json({ message: 'No user found with this id' });
            return;
        }
        res.json(dbUserData);
        })
        .catch(err => {
        console.log(err);
        res.status(500).json(err);
        });
    });



// export
module.exports = router;