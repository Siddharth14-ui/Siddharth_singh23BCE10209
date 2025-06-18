const mongoose = require("mongoose");
const { Schema } = mongoose;    
mongoose.connect('mongodb+srv://siddharth1439969:Cx0DYVJYGcX3P8WU@clustersid.fvyefyj.mongodb.net/')
  
const userSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    image: {
        type: String,
        required: true
    }
});     
module.exports = mongoose.model("User", userSchema);