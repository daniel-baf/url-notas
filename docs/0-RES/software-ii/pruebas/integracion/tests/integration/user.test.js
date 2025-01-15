const request = require("supertest");
const app = require("../../src/app");
const db = require("../../src/utils/database");

beforeAll(async () => {
  // Inserta datos iniciales para pruebas
  await db.query(
    "INSERT INTO users (name, email) VALUES ('Jane Doe', 'jane.doe@example.com')"
  );
});

afterAll(async () => {
  // Limpia la base de datos
  await db.query("DELETE FROM users");
});

describe("Pruebas de integración para el API de usuarios", () => {
  it("Debe devolver una lista de usuarios", async () => {
    const response = await request(app).get("/api/users");
    expect(response.statusCode).toBe(200);
    expect(response.body).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          name: expect.any(String),
          email: expect.any(String),
        }),
      ])
    );
  });

  it("Debe permitir crear un nuevo usuario", async () => {
    const newUser = { name: "Alice", email: "alice@example.com" };
    const response = await request(app).post("/api/users").send(newUser);

    expect(response.statusCode).toBe(201);
    expect(response.body).toEqual(expect.objectContaining(newUser));

    // Verifica que el usuario fue agregado a la base de datos
    const users = await db.query("SELECT * FROM users WHERE email = ?", [
      newUser.email,
    ]);
    expect(users.length).toBe(1);
    expect(users[0]).toMatchObject(newUser);
  });

  it("Debe retornar error si faltan datos al crear un usuario", async () => {
    const response = await request(app)
      .post("/api/users")
      .send({ name: "Bob" });
    expect(response.statusCode).toBe(400);
    expect(response.body).toHaveProperty(
      "error",
      "Faltan datos requeridos (name, email)"
    );
  });
});
