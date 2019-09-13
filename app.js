var express = require('express'),
    path = require('path'),
    bodyParser = require('body-parser'),
    cons = require('consolidate'),
    dust = require('dustjs-helpers'),
    pg = require('pg'),
    app = express();

// DB Connect String
var config = {
  host: 'localhost',
  user: 'abdul',
  database: 'recipesbookdb',
  password: 'helloworld',
  port: 5432,
  max: 10, // max number of connection can be open to database
  idleTimeoutMillis: 30000, // how long a client is allowed to remain idle before being closed
};

// Assing Dust Engine To .dust Files
app.engine('dust', cons.dust);

// Set Default Ext .dust
app.set('view engine', 'dust');
app.set('views', __dirname + '/views');

// Set Public Folder
app.use(express.static(path.join(__dirname, 'public')));

// Body PArser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

app.get('/', function(req, res){
  var pool = new pg.Pool(config)
  // PG Connect
  pool.connect( function(err, client, done) {
    if(err) {
      return console.error('error fetching client from pool', err);
    }
    client.query('SELECT * FROM recipes', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      res.render('index', {recipes: result.rows})
      done();
    });
  });
});

app.post('/add', function(req, res){
  var pool = new pg.Pool(config)
  // PG Connect
  pool.connect( function(err, client, done) {
    if(err) {
      return console.error('error fetching client from pool', err);
    }
    client.query("INSERT INTO recipes(name, ingredients, directions) VALUES($1, $2, $3)", [req.body.name, req.body.ingredients, req.body.directions]);
    done();
    res.redirect('/');
  });
});

app.delete('/delete/:id', function(req, res){
  var pool = new pg.Pool(config)
  // PG Connect
  pool.connect( function(err, client, done) {
    if(err) {
      return console.error('error fetching client from pool', err);
    }
    client.query("DELETE FROM recipes WHERE id = $1", [req.params.id]);
    done();
    res.sendStatus(200);
  });
});

app.post('/edit', function(req, res){
  var pool = new pg.Pool(config)
  // PG Connect
  pool.connect( function(err, client, done) {
    if(err) {
      return console.error('error fetching client from pool', err);
    }
    client.query("UPDATE recipes SET name=$1, ingredients=$2, directions=$3 WHERE id = $4", [req.body.name, req.body.ingredients, req.body.directions, req.body.id]);
    done();
    res.redirect('/');
  });
});

// Server
app.listen(3000, function(){
  console.log('Server started on port 3000');
});
