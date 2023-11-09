Haremos uso del protocolo `firm-ata` para conectarnos a un Arduino usando de node.js

```
mkdir <dir>
cd <dir>
npm i johnny-five
npm i --save express socket.io
```


Las conexiones en windows es mediante `COM`
Las conexiones mediante Linux es `/dev/ttyUSB`

EJEMPLO CLASICO:

```js
let five = require("johnny-five"); // acces to JF api
let board = new five.Board({ port: "/dev/tty/ACM0", repl: false });

board.on("ready", () => {
	let led = new five.Led(13); // create a led at arduino's port 13
	led.blink(500);
});

board.on("error", (e) => { console.log("EROR" + e.message);});
```

Abrimos una terminal

```js
let five = require("johnny-five"); // acces to JF api
let board = new five.Board({ port: "/dev/tty/ACM0", repl: false });

board.on("ready", () => {
	let led = new five.Led(13); // create a led at arduino's port 13
	led.off();
	this.repl.inject({
		l1: led
	});
});

board.on("error", (e) => {
	console.log("ERRcOR" + e.message);
});
```

Podemos usar otros componentes como si fueran led.
Próximamente estaremos usando `socket.IO`

`npm i socket.io`

`socket.io` permite el enlace. Así que tendremos que instalar `express` o `electron` para correr un servidor web.

`npm i --save express`


