Algunas dependencias usable en un backed de Node JS

```json
dependencies: {
	"bcryptjs": "^2.4.3",
	"cors": "^2.8.5",
	"dotenv": "^16.4.5",
	"esm-module-alias": "^2.2.1",
	"express": "^4.19.2",
	"express-session": "^1.18.0",
	"mysql2": "^3.11.0",
	"path": "^0.12.7",
	"process": "^0.11.10",
	"sequelize": "^6.37.3"
}
```

CONFIGURACIONES
```js
import express from "express";
import session from "express-session";
import path from "path";
import morgan from "morgan";
import cors from "cors";
import dotenv from "dotenv";
import http from "http";
import bundle_router from "./routes.js";

// server configuration

const app = express(); // server builder
const __dirname = path.resolve(); // get current directory

dotenv.config(); // load environment variables

app.set("port", process.env.SERVER_PORT); // server port
app.set("project-name", "hotel 2024"); // server name
app.set("view engine", "ejs"); // view engine
app.set("views", path.join(__dirname, "src/views")); // views folder

// server attachments
app.use(morgan("dev")); // log all requests
app.use(express.static(path.join(__dirname, "public"))); // static files
app.use(cors()); // implement CORS flags for browsers
app.use(express.urlencoded({ extended: true }), express.json()); // JSON implement

app.use(cookieParser("keyboard cat"));
// session

app.use(
	session({
		secret: process.env.SECRET_KEY,
		saveUninitialized: false,
		resave: false,
		cookie: { 
			maxAge: 60000, 
			sameSite: "Strict", 
			secure: false },// TODO? se configura secure: false porque estamos en produccion, usando HTTP, se debe cambiar a true cuando se use HTTPS
}));

// styles

/*
// CSS

app.use(

"/css",

express.static(path.join(__dirname, "node_modules/bootstrap/dist/css")),

express.static(path.join(__dirname, "node_modules/bootstrap-icons/font/"))

); // <- This will use the contents of 'bootstrap/dist/css' which is placed in your node_modules folder as if it is in your '/styles/css' directory.

app.use(

"/js",

express.static(path.join(__dirname, "node_modules/bootstrap/dist/js")),

express.static(path.join(__dirname, "node_modules/chart.js/dist/"))

); // <- This will use the contents of 'bootstrap/dist/css' which is placed in your node_modules folder as if it is in your '/styles/css' directory.
*/
  

// ROUTER

app.use(bundle_router); // add routes
const server = http.createServer(app); // create a server allocate app object

server.listen(app.get("port")); // start server at port SERVER_PORT

  

server
	.on("listening", () => {
		console.log(`${app.get("project-name")} is running on port ${app.get("port")}`
	);})
	.on("error", (error) => {
		console.log("Error starting server\n" + error);
});
```