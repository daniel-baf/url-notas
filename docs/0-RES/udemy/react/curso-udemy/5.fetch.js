const url = `https://jsonplaceholder.typicode.com/users`;

fetch(url)
  .then((response) => response.json()) // response.json() returns a promise
  .then((data) => console.log(data))
  .catch((error) => console.log(error));

fetch(url, {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    Authorization: "Bearer aca_deberia_ir_nuestra_API_KEY",
  },
  body: JSON.stringify({
    name: "PEPE",
    website: "google.com",
  }),
})
  .then((response) => response.json()) // response.json() returns a promise
  .then((data) => console.log(data))
  .catch((error) => console.log(error));
