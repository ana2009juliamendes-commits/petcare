const express = require("express");
const cors = require("cors");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    mensagem: "PetCare API está funcionando! 🐾"
  });
});

app.get("/api/status", (req, res) => {
  res.json({
    status: "online",
    projeto: "PetCare"
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`PetCare API rodando na porta ${PORT}`);
});
