const express = require('express');
const bodyParser = require('body-parser');
const db = require('./queries');
const cors = require('cors');
  
const app = express();
const PORT = 3010;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}))
app.use(cors());
  
app.get("/users",db.getUsers)

app.get("/users/:id/friends", db.getUser);

app.get("/max-following", db.getMaxSubscriptions);

app.get("/not-following", db.getZeroSubscription);

app.listen(PORT, (error) =>{
    if(!error)
        console.log("Server is Successfully Running, and App is listening on port "+ PORT)
    else 
        console.log("Error occurred, server can't start", error);
    }
);


