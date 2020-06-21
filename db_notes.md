NOTES

containing mysql copy from a prev assignment..

## Usage
- Within the VSCode terminal, start MySQL
-   $ `mysql -u root -p`
- Enter your MySQL password when prompted

- Create the database, tables and seed the tables
-   mysql> `source ./db/schema.sql`
-   mysql> `source ./db/seeds.sql`
- Run the application within the terminal
-   $ `npm start`
- ![invokeapp](./img/<insert>.jpg "Start application")
- To see how to invoke the command-line application on the terminal, and then afterwards how to view the tables via MySQL command-line, here is a quick walkthrough:
<insert walkthrough link>

## Schema
- To view the database scheme from the terminal, initiate the MySQL command line, 
by typing:     `mysql -u root -p`    in your command line, then add your MySQL password when prompted.

- Check the database and tables were created by running in the MySQL command line,
* mysql> `USE the_tech_blog_db; show tables; describe comment; describe post; describe Tag;describe user;describe vote;`
- You should see this result
- ![showtables](./img/<insert>.jpg "Show tables")

- Check the tables after seeding by running in the mysql command line, sample
* mysql> `select * from comment;select * from post;select * from user;select * from vote;`
- You should see this result
- ![selecttables](./img/<insert>.jpg "Select tables")

## How to publish to Heroku
- If you are uploading your app to Heroko, proceed in this order:
1. Get an account setup at the Heroku site, to include setting up payment plan for the JawsDB add-on. Note, we'll be selecting the free version but a credit card is required.
2. Validate the Node site is working locally, starting the app in bash with an `npm start`, and verifying in the mysql command prompt that the Sequelize models are creating the tables as expected. Also validate the GET and POST endpoints are working through Insomnia and http://localhost:3003 

Note: before pushing to master, make sure the build table option is set to true within the server.js,
            `sequelize.sync({ force: true }).then(() => { `

1. Push your Node app to github `git push origin master`
2. After pushing to your master GitHub repo, then run the following in the bash terminal
- `heroku create <yourgithubname-blogname>`
- In Heroku, under the new app, Resources tab, search and select JawsDB, then provision JawsDB free or default version. View the Heroko Dashboard to provision JawsDB add-on:
- `$ heroku addons:open jawsdb`
Then run in the bash terminal to push the latest version to Heroku.
- `git push heroku master`
- Goto the URL where Heroku published the content
https://ktrnthsnr-the-tech-blog.herokuapp.com
- Here is a walkthrough on how to deploy to Heroku from VSCode 
https://drive.google.com/file/d/1TNf9OdHX92O0jyQCso5bBjieMaatqJej/view
- For more info, see your Heroku Dashboard: 
https://dashboard.heroku.com/apps