const express= require('express');

const app = express();  
const path = require('path');
app.set('view engine', 'ejs');
const mongoose = require('mongoose');
const userModel = require('./models/models.models.js'); // Adjust the path as necessary
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/',(req,res)=>{
    res.render('index')
})
app.get("/read",async (req,res)=>{

    let allusers = await userModel.find()
    res.render('read',{allusers});
})
app.get("/create",(req,res)=>{
    // res.render('read')
})

app.post("/create",async (req,res)=>{
    let {name, email, image} = req.body
    const user = await userModel.create({
        name: name,
        email: email,
        image: image
    });
    res.redirect('/read'); // Redirect to the read page after creation
})
app.get("/update/:id", async (req, res) => {
    const user = await userModel.findById(req.params.id);
    res.render('update', { user });
});

app.post("/update/:id", async (req, res) => {
    let id = req.params.id;
    const { name, email, image } = req.body;
    await userModel.findByIdAndUpdate(id, { name, email, image });
    res.redirect('/read'); // Redirect to the read page after update
});
app.get("/delete/:id",async (req,res)=>{
    const user = await userModel.findOneAndDelete({_id: req.params.id});
    res.redirect('/read'); // Redirect to the read page after deletion
})
app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});