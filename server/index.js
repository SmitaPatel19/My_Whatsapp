const express = require("express");
var http = require("http");
const app = express();
// const port = process.env.PORT || 5000;
var server = http.createServer(app);
var io = require("socket.io")(5000);

//middlewre
app.use(express.json());
var clients = {};

io.on("connection", (socket) => {
    console.log("connetetd");
    console.log(socket.id, "has joined");
    socket.on("signin", (id) => {
        console.log(id);
        clients[id] = socket;
        console.log(clients);
    });
    socket.on("message", (msg) => {
        console.log(msg);
        let targetId = msg.targetId;
        clients[targetId].emit("message", msg);
    });
});


server.listen(3000, () => {
    console.log("listening on *:3000");
});